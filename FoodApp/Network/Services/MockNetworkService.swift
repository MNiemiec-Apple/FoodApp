//
//  MockDataProvider.swift
//  FoodApp
//
//  Created by Michał Niemiec on 30/05/2022.
//

import Foundation

class MockDataProvider: DataProviderProtocol {
    func fetchFoods() async -> [FoodModel] {
        guard let foods = JSONHelper.loadJson(filename: "mock_foods", type: [FoodModel].self) else {
            return []
        }
        return foods
    }

    func addFood() async {
    }
}

struct JSONHelper {
    static func loadJson<T: Decodable>(filename fileName: String, type: T.Type) -> T? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
