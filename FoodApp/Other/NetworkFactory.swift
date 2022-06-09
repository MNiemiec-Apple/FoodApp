//
//  NetworkFactory.swift
//  FoodApp
//
//  Created by Michał Niemiec on 30/05/2022.
//

import Foundation

protocol NetworkProvider {
    func fetchFood() async -> FoodResponse?
}

protocol NetworkFactory {
    func createNetworkService() -> NetworkProvider
}

class OnlineDataProviderFactory: NetworkFactory {
    @MainActor func createNetworkService() -> NetworkProvider {
        NetworkService()
    }
}
