//
//  ContentView.swift
//  Day009
//
//  Created by Joseph Muller on 2/27/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    var body: some View {
        RealityView{ content in
            let sphere : Entity = ModelEntity(
                mesh: .generateSphere(radius: 0.1),
                materials: [SimpleMaterial(color: .blue, isMetallic: false)]
            )
            
            sphere.position = SIMD3(0.4,0,0)
            content.add(sphere)
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
