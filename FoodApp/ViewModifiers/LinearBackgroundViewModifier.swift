//
//  LinearBackgroundViewModifier.swift
//  FoodApp
//
//  Created by Michał Niemiec on 09/06/2022.
//

import Foundation
import SwiftUI

struct LinearBackground: ViewModifier {
    var calories: Int

    func body(content: Content) -> some View {
        content
            .background(backgroundColor(calories))
    }

    func backgroundColor(_ calories: Int) -> LinearGradient {
        let linearGradient: LinearGradient

        switch calories {
        case 0..<100:
            linearGradient = LinearGradient.topToBottom(colors: [.green, .yellow])
        case 100..<200:
            linearGradient = LinearGradient.topToBottom(colors: [.yellow, .orange])
        case 200..<400:
            linearGradient = LinearGradient.topToBottom(colors: [.orange, .red])
        default:
            linearGradient = LinearGradient.topToBottom(colors: [.red, .purple])
        }
        return linearGradient
    }
}
