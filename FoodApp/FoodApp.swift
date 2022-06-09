//
//  FoodAppApp.swift
//  FoodApp
//
//  Created by Michał Niemiec on 17/05/2022.
//

import SwiftUI

@main
struct FoodApp: App {
    @StateObject var networkMonitor: NetworkMonitor
    @StateObject var state: AppState

    init() {
        self._networkMonitor = StateObject(wrappedValue: NetworkMonitor())
        self._state = StateObject(wrappedValue:AppState(DataProvider(FoodsDataService())))
    }

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(state)
                .preferredColorScheme(.light)
        }
    }
}

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

