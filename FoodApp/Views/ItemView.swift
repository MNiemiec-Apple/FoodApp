//
//  ItemView.swift
//  FoodApp
//
//  Created by Michał Niemiec on 18/05/2022.
//

import SwiftUI

struct ItemView: View {
    @State private var showingSheet = false

    private var foodModel: FoodModel

    private var title: String {
        foodModel.title
    }

    private var calories: Double {
        foodModel.calories
    }

    var body: some View {
        Text(title.uppercased())
            .font(.headline)
            .foregroundColor(.white)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(24)
            .linearBackground(Int(calories))
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 8)
            .onTapGesture {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                DetailsView(foodModel)
            }
    }
}   

extension ItemView {
    init(_ foodModel: FoodModel){
        self.foodModel = foodModel
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        return ItemView(FoodModel(title: "Test", calories: 100, carbs: 0.23, protein: 20, fat: 20.4, saturatedfat: 22, unsaturatedfat: 0.002, fiber: 44, cholesterol: 32, sugar: 2232, sodium: 223.3, potassium: 12.2, gramsperserving: 0, pcstext: "Test"))
    }
}

extension View {
    func linearBackground(_ calories: Int) -> some View {
        modifier(LinearBackground(calories: calories))
    }
}
