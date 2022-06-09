//
//  NetworkMonitor.swift
//  FoodApp
//
//  Created by Michał Niemiec on 30/05/2022.
//

import Foundation
import Network
import Combine

extension Notification.Name {
     static let networkStateChanged = Notification.Name("network_state_changed")
 }

class NetworkMonitor: ObservableObject {
    private let monitor = NWPathMonitor()
    @Published var ifOfflineMode = false

    init() {
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
        checkConnection()
    }

    private func checkConnection() {
        monitor.pathUpdateHandler = { [self] path in
            DispatchQueue.main.async{ [self] in
                if path.status == .satisfied {
                    print("We're connected!")
                    ifOfflineMode = false
                } else {
                    print("No connection.")
                    ifOfflineMode = true
                }
                NotificationCenter.default.post(name: .networkStateChanged, object: ifOfflineMode)
            }
        }
    }

}
