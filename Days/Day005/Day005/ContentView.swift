//
//  ContentView.swift
//  Day005
//
//  Created by Joseph Muller on 2/20/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State var scale = false
    var body: some View {
        VStack {
            //Model3D(named: "Pancakes AR")
            RealityView{ content in
                let model = ModelEntity(
                    mesh: .generateCylinder(height: 1, radius: 0.1),
                    materials: [
                        SimpleMaterial(color: .red, isMetallic: true),
                    ])
                                
                model.components.set(InputTargetComponent())
                model.components.set(CollisionComponent(
                    shapes: [.generateBox(width: 0.2, height: 1, depth: 0.2)],
                    mode: .colliding,
                    filter: .default
                ))
                content.add(model)
            } update: { content in
                if let model = content.entities.first {
                    model.transform.scale = scale ? [1.2, 1.2, 1.2]: [ 1.0, 1.0, 1.0]
                }
            }
            .gesture( LongPressGesture().targetedToAnyEntity().onEnded { _ in
                scale.toggle()
            })
            
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
