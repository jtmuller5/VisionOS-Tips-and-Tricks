//
//  ContentView.swift
//  Day003
//
//  Created by Joseph Muller on 2/14/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @Environment (\.openWindow) private var openWindow
    
    var body: some View {
        VStack {
            Image(systemName: "visionpro")
                .font(.system(size: 150))
                .symbolEffect(.pulse)
                .bold()
            HStack {
                Button("Window 1") {
                    print("open window 1")
                    openWindow(id: "Window 1")
                }
                Button(action: {
                    print("test")
                    openWindow(id: "Window 2")
                }, label:{ Text("Window 2")})
            }
            
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
