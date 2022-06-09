//
//  ComponentsView.swift
//  FoodApp
//
//  Created by Michał Niemiec on 09/06/2022.
//

import SwiftUI

struct ComponentsView: View {
    var foodModel: FoodModel

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(foodModel.components()) { component in
                    HStack {
                        Text(component.name)
                        Spacer()
                        Text(component.formattedValue)
                    }
                    .padding(8)
                }
            }
        }
    }
}

struct ComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentsView(foodModel: FoodModel(title: "Test", calories: 100, carbs: 0.23, protein: 20, fat: 20.4, saturatedfat: 22, unsaturatedfat: 0.002, fiber: 44, cholesterol: 32, sugar: 2232, sodium: 223.3, potassium: 12.2, gramsperserving: 0, pcstext: "Test"))
    }
}
