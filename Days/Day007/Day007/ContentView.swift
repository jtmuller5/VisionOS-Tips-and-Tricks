//
//  ContentView.swift
//  Day007
//
//  Created by Joseph Muller on 2/25/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        VStack {
            Button("Open new mail viewer") {
                openWindow(id: "mail-viewer")
            }
            Button("Open new window by type") {
                openWindow(id: "type-view", value: 1)
            }
            Button("Open new window by type") {
                openWindow(id: "type-view", value: 2)
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
