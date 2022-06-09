//
//  FootModel.swift
//  FoodApp
//
//  Created by Michał Niemiec on 17/05/2022.
//

import Foundation

struct FoodResponse: Codable {
    let meta: Meta
    let response: FoodModel
}

// MARK: - Meta
struct Meta: Codable {
    let code: Int
}

enum Unit {
    case energy
    case mass
}

struct Component: Identifiable {
    var id = UUID()
    var name: String
    var value: Double
    var unit: Unit

    var formattedValue: String {
        switch unit {
        case .energy:
            return String(format: "%2d kcal", Int(value))
        case .mass:
            if value < 1 {
                return String(format: "%.0f mg", value * 100)
            } else {
                return String(format: "%.2f g", value)
            }
        }
    }
}

// MARK: - FoodModel
struct FoodModel: Codable {
    let title: String
    let calories: Double
    let carbs, protein, fat, saturatedfat: Double
    let unsaturatedfat: Double
    let fiber: Double
    let cholesterol: Double
    let sugar: Double
    let sodium, potassium: Double
    let gramsperserving: Double
    let pcstext: String

    func components() -> [Component] {
        [
            .init(name: Food.Component.calories, value: calories, unit: .energy),
            .init(name: Food.Component.carbs, value: carbs, unit: .mass),
            .init(name: Food.Component.protein, value: protein, unit: .mass),
            .init(name: Food.Component.fat, value: fat, unit: .mass),
            .init(name: Food.Component.saturatedfat, value: saturatedfat, unit: .mass),
            .init(name: Food.Component.unsaturatedfat, value: unsaturatedfat, unit: .mass),
            .init(name: Food.Component.fiber, value: fiber, unit: .mass),
            .init(name: Food.Component.cholesterol, value: cholesterol, unit: .mass),
            .init(name: Food.Component.sugar, value: sugar, unit: .mass),
            .init(name: Food.Component.sodium, value: sodium, unit: .mass),
            .init(name: Food.Component.potassium, value: potassium, unit: .mass)
        ]
    }

    init(entity: FoodEntity) {
        self.title = entity.title ?? ""
        self.calories = entity.calories
        self.carbs = entity.carbs
        self.protein = entity.protein
        self.fat = entity.fat
        self.saturatedfat = entity.saturatedfat
        self.unsaturatedfat = entity.unsaturatedfat
        self.fiber = entity.fiber
        self.cholesterol = entity.cholesterol
        self.sugar = entity.sugar
        self.sodium = entity.sodium
        self.potassium = entity.potassium
        self.gramsperserving = entity.gramsperserving
        self.pcstext = entity.pcstext ?? ""
    }
}

extension FoodModel: Identifiable {
    var id: UUID { UUID() }
}

extension FoodModel {
    init(title: String, calories: Double, carbs: Double, protein: Double, fat: Double, saturatedfat: Double, unsaturatedfat: Double, fiber: Double, cholesterol: Double, sugar: Double, sodium: Double, potassium: Double, gramsperserving: Double, pcstext: String) {
        self.title = title
        self.calories = calories
        self.carbs = carbs
        self.protein = protein
        self.fat = fat
        self.saturatedfat = saturatedfat
        self.unsaturatedfat = unsaturatedfat
        self.fiber = fiber
        self.cholesterol = cholesterol
        self.sugar = sugar
        self.sodium = sodium
        self.potassium = potassium
        self.gramsperserving = gramsperserving
        self.pcstext = pcstext
    }
}
