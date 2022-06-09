//
//  NetwrokService.swift
//  FoodApp
//
//  Created by Michał Niemiec on 17/05/2022.
//

import Foundation

class NetworkService {
}

extension NetworkService: HTTPClient, NetworkProvider {
    func fetchFood() async -> FoodResponse? {
        let result = await sendRequest(endpoint: FoodsEndpoint(Int.random(in: 1...200)), responseModel: FoodResponse.self)
        switch result {
        case .success(let model):
            return model
        case .failure(_):
            return nil
        }
    }
}
