//
//  DetailsView.swift
//  FoodApp
//
//  Created by Michał Niemiec on 18/05/2022.
//

import SwiftUI

struct DetailsView: View {

    private var foodModel: FoodModel

    var body: some View {
        VStack(alignment: .center) {
            HeaderView()
            Text(foodModel.title.uppercased())
                .font(.title)
                .foregroundColor(.black)
            ComponentsView(foodModel: foodModel)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .linearBackground(Int(foodModel.calories)).opacity(0.8)
    }

    init(_ foodModel: FoodModel) {
        self.foodModel = foodModel
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(FoodModel(title: "Test", calories: 100, carbs: 0.23, protein: 20, fat: 20.4, saturatedfat: 22, unsaturatedfat: 0.002, fiber: 44, cholesterol: 32, sugar: 2232, sodium: 223.3, potassium: 12.2, gramsperserving: 0, pcstext: "Test"))
            .previewDevice("iPhone SE (2nd generation)")
    }
}
