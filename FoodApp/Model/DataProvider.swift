//
//  DataProvider.swift
//  FoodApp
//
//  Created by Michał Niemiec on 18/05/2022.
//

import Foundation

protocol DataProviderProtocol {
    func fetchFoods() async -> [FoodModel]
    func addFood() async
}

class DataProvider: ObservableObject {
    private let foodsDataService: FoodsDataServiceProtocol!
    private var foods: [FoodModel] = []
    private var requestInProcess = false

    init(_ foodsDataService: FoodsDataService) {
        self.foodsDataService = foodsDataService
    }
}

extension DataProvider: DataProviderProtocol {
    func fetchFoods() async -> [FoodModel] {
        var foods = [FoodModel]()
        if !requestInProcess {
            requestInProcess = true
            foods = await foodsDataService.fetchFoods()
            requestInProcess = false
        }
        return foods
    }

    func addFood() async {
        await foodsDataService.addFood()
    }
}
