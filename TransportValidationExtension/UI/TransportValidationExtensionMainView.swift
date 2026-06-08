//
//  TransportValidationExtensionMainView.swift
//  TransportValidationExtension
//
//  Created by Ryan Francesconi on 6/8/26.
//

import SwiftUI

struct TransportValidationExtensionMainView: View {
    var parameterTree: ObservableAUParameterGroup
    
    var body: some View {
        ParameterSlider(param: parameterTree.global.gain)
    }
}
