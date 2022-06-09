//
//  PhotosDataService.swift
//  FoodApp
//
//  Created by Michał Niemiec on 26/05/2022.
//

import Foundation

protocol FoodsDataServiceProtocol {
    func addFood() async
    func fetchFoods() async -> [FoodModel]
}

class FoodsDataService {
    private let foodEntityService = FoodEntityService()

    private func fetchFoodsFromNetwork() async -> FoodResponse? {
        await NetworkService().fetchFood()
    }

    private func fetchFoodsFromDataPersistence() async -> [FoodModel] {
        await foodEntityService.fetchAll()
    }
}

extension FoodsDataService: FoodsDataServiceProtocol {
    func addFood() async {
        let items = await fetchFoods()
        if let welcome = await fetchFoodsFromNetwork() {
            foodEntityService.add(welcome, place: items.count+1)
        }
    }

    func fetchFoods() async -> [FoodModel] {
        var items = [FoodModel]()
        items = await fetchFoodsFromDataPersistence()
        if items.isEmpty {
            guard let welcome = await fetchFoodsFromNetwork() else {
                return items
            }
            foodEntityService.add(welcome, place: items.count+1)
            items = await fetchFoodsFromDataPersistence()
        }
        return items
    }
}
