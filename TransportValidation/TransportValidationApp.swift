//
//  TransportValidationApp.swift
//  TransportValidation
//
//  Created by Ryan Francesconi on 6/8/26.
//

import SwiftUI

@main
struct TransportValidationApp: App {
    private let hostModel = AudioUnitHostModel()

    var body: some Scene {
        WindowGroup {
            ContentView(hostModel: hostModel)
        }
    }
}
