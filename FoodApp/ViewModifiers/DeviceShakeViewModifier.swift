//
//  DeviceShakeViewModifier.swift
//  FoodApp
//
//  Created by Michał Niemiec on 06/06/2022.
//

import Foundation
import SwiftUI

struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}
