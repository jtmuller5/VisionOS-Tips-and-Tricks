//
//  Day015App.swift
//  Day015
//
//  Created by Joseph Muller on 2/27/24.
//

import SwiftUI

@main
struct Day015App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
