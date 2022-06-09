//
//  ContentView.swift
//  FoodApp
//
//  Created by Michał Niemiec on 17/05/2022.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var dataProvider: DataProvider
    @EnvironmentObject var state: AppState

    @Environment(\.editMode) private var editMode
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        buildView(state)
            .onChange(of: scenePhase) { newPhase in
                switch newPhase {
                case .active:
                    state.current = state.activeState
                case .background:
                    state.current = .background
                case .inactive:
                    break
                @unknown default:
                    break
                }
            }
            .onShake {
                state.current = .adding
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


extension MainView {
    private func buildView(_ state: AppState) -> some View {
        VStack(alignment: .trailing) {
            switch state.current {
            case .empty, .fetching, .adding:
                ProgressView()

            case .ready(let foods), .offline(let foods):
                List {
                    ForEach(foods) { item in
                        ItemView(item)
                            .listRowSeparator(.hidden)
                    }
                    .padding(.bottom, 1)
                }
                .listStyle(PlainListStyle())
                .alert("alert.mode.offline.title".localized(), isPresented: $state.ifOffline) {
                    Button("alert.action.ok".localized(), role: .cancel) {
                    }
                } message : {
                    Text("alert.mode.offline.message".localized())
                }

            case .background:
                Color.red
                    .ignoresSafeArea()
            }
        }
        .padding(1)
    }
}
