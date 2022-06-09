//
//  Locale.swift
//  FoodApp
//
//  Created by Michał Niemiec on 09/06/2022.
//

import Foundation

enum Food {
    enum Component {
        static let calories = "food.component.calories".localized()
        static let carbs = "food.component.carbs".localized()
        static let protein = "food.component.protein".localized()
        static let fat = "food.component.fat".localized()
        static let saturatedfat = "food.component.saturatedfat".localized()
        static let unsaturatedfat = "food.component.unsaturatedfat".localized()
        static let fiber = "food.component.fiber".localized()
        static let cholesterol = "food.component.cholesterol".localized()
        static let sugar = "food.component.sugar".localized()
        static let sodium = "food.component.sodium".localized()
        static let potassium = "food.component.potassium".localized()
    }
}
