//
//  Day006App.swift
//  Day006
//
//  Created by Joseph Muller on 2/24/24.
//

import SwiftUI

@main
struct Day006App: App {
    var body: some Scene {
        WindowGroup {
                ContentView().tabItem {
                    Label("Rotate", systemImage: "rotate.3d")
                }
//                TranslateView().tabItem {
//                    Label("Translate", systemImage: "move.3d")
//               }
            
        }.windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
