//
//  LinearGradient+Extensions.swift
//  FoodApp
//
//  Created by Michał Niemiec on 09/06/2022.
//

import Foundation
import SwiftUI

extension LinearGradient {
    static func topToBottom(colors: [Color]) -> LinearGradient {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
    }
}
