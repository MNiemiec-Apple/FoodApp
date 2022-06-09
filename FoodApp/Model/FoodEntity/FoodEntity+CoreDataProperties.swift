//
//  DishEntity+CoreDataProperties.swift
//  FoodApp
//
//  Created by Michał Niemiec on 30/05/2022.
//
//

import Foundation
import CoreData


extension FoodEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodEntity> {
        return NSFetchRequest<FoodEntity>(entityName: "FoodEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var calories: Double
    @NSManaged public var carbs: Double
    @NSManaged public var protein: Double
    @NSManaged public var fat: Double
    @NSManaged public var saturatedfat: Double
    @NSManaged public var unsaturatedfat: Double
    @NSManaged public var fiber: Double
    @NSManaged public var cholesterol: Double
    @NSManaged public var sugar: Double
    @NSManaged public var sodium: Double
    @NSManaged public var potassium: Double
    @NSManaged public var gramsperserving: Double
    @NSManaged public var pcstext: String?
    @NSManaged public var place: Double

    func update(with model: FoodResponse, place: Int) {
        let response = model.response
        self.title = response.title
        self.calories = response.calories
        self.carbs = response.carbs
        self.protein = response.protein
        self.fat = response.fat
        self.saturatedfat = response.saturatedfat
        self.unsaturatedfat = response.unsaturatedfat
        self.fiber = response.fiber
        self.cholesterol = response.cholesterol
        self.sugar = response.sugar
        self.sodium = response.sodium
        self.potassium = response.potassium
        self.gramsperserving = response.gramsperserving
        self.pcstext = response.pcstext
        self.place = Double(place)
    }
}

extension FoodEntity : Identifiable {

}
