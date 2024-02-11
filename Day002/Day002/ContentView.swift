//
//  ContentView.swift
//  Day002
//
//  Created by Joseph Muller on 2/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
       private let url = URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/teapot/teapot.usdz")!
    
       
       var body: some View {
           VStack {
               RealityView { content in
                          let model = ModelEntity(
                            // mesh: .generateBox(size: Float(2), cornerRadius: 0),
                            mesh: .generateSphere(radius: 0.1),
                            materials: [SimpleMaterial(color: .purple, isMetallic: true)])
                          content.add(model)
                      }
           }
           .padding()
       }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
