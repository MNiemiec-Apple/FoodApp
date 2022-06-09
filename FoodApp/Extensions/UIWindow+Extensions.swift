//
//  UIWindow+Extensions.swift
//  FoodApp
//
//  Created by Michał Niemiec on 06/06/2022.
//

import Foundation
import UIKit

extension UIWindow {
     open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
     }
}
