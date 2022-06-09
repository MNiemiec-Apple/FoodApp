//
//  HeaderView.swift
//  FoodApp
//
//  Created by Michał Niemiec on 09/06/2022.
//

import SwiftUI

struct HeaderView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack() {
            Spacer()
            Button {
                dismiss()
            } label: {
                Image(systemName: "multiply")
                    .resizable()
                    .renderingMode(.template)
                    .tint(.black)
            }
            .frame(width: 20, height: 20)
            .padding()
        }
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
