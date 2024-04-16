//
//  Timer_bootcampApp.swift
//  Timer bootcamp
//
//  Created by Devasurya on 05/04/24.
//

import SwiftUI
import Combine

@main
struct Timer_bootcampApp: App {
    /// Variable declarations.
    private var cancellables: Set<AnyCancellable> = []
    init(){
        orientationSensor()
    }
    /// Function to fire a result when the orientation of the simulator changes using the notificationcenter & publisher..
    mutating func orientationSensor () {
        NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .sink { _ in
                let currentOrientation = UIDevice.current.orientation
                print("isLandscape---->\(currentOrientation.isLandscape)")
            }
            .store(in: &cancellables)
    }
    var body: some Scene {
        WindowGroup {
           JustPublisherView()
        }
    }
}
