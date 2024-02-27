//
//  Day009App.swift
//  Day009
//
//  Created by Joseph Muller on 2/27/24.
//

import SwiftUI

@main
struct Day009App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
