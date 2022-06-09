//
//  View+Extensions.swift
//  FoodApp
//
//  Created by Michał Niemiec on 06/06/2022.
//

import SwiftUI

extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}
