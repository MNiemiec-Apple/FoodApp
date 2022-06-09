//
//  AppState.swift
//  FoodApp
//
//  Created by Michał Niemiec on 06/06/2022.
//

import Foundation
import Combine

enum AppStateType {
    case ready([FoodModel])
    case offline([FoodModel])
    case fetching
    case adding
    case empty
    case background
}

@MainActor
class AppState: ObservableObject {
    @Published var ifOffline: Bool = true
    @Published var current: AppStateType = .empty {
        didSet {
            Task {
                switch current {
                case .ready(_):
                    break
                case .offline(_):
                    break
                case .fetching:
                    let foods = await dataProvider.fetchFoods()
                    self.foods = foods
                    current = .ready(foods)
                case .adding:
                    await dataProvider.addFood()
                    current = .fetching
                case .empty:
                    current = .fetching
                case .background:
                    break
                }
            }
        }
    }

    private var cancellable: AnyCancellable?
    private var foods: [FoodModel] = []
    private var dataProvider: DataProviderProtocol

    init(_ dataProvider: DataProviderProtocol) {
        self.dataProvider = dataProvider
        cancellable = NotificationCenter.default.publisher(for: .networkStateChanged)
            .compactMap{ $0.object as? Bool }
            .sink { [self] ifOfflineMode in
                Task {
                    current = ifOfflineMode ? await .offline(dataProvider.fetchFoods()) : current
                    ifOffline = ifOfflineMode
                }
            }
    }

    var activeState: AppStateType {
        if !self.ifOffline {
            return foods.isEmpty
            ? .fetching
            : .ready(foods)
        }
        return current
    }

    deinit {
        cancellable?.cancel()
    }
}
