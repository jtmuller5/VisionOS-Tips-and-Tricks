//
//  Day008App.swift
//  Day008
//
//  Created by Joseph Muller on 2/25/24.
//

import OSLog
import ARKit
import SwiftUI
import RealityKit

@main
struct Day008App: App {
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    @Environment(\.dismiss) var dismissWindow

    @StateObject var model = ViewModel()

    var body: some SwiftUI.Scene {
        
        ImmersiveSpace {
            RealityView { content in
            }
            .task {
                await model.runSession()
            }
        }
    }
}
