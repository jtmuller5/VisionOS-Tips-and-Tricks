//
//  ContentView.swift
//  Day006
//
//  Created by Joseph Muller on 2/24/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State var entity = Entity()
    
    var body: some View {
        VStack {
            RealityView { content in
                if let scene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
                    entity = scene
                    content.add(scene)
                }
            }
            .gesture(TapGesture().targetedToAnyEntity().onEnded{ value in
                print("rotation: ", value.entity.transform.rotation)
                print("orientation: ", value.entity.orientation)
            })
            .gesture(RotateGesture3D(minimumAngleDelta: .degrees(10)).targetedToAnyEntity().onChanged{ value in
                
                value.entity.orientation = value.convert(value.rotation, from: .local, to: entity)
            })
        }}
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
