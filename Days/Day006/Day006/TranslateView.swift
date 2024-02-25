//
//  TranslateView.swift
//  Day006
//
//  Created by Joseph Muller on 2/25/24.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct TranslateView: View {
    
    @State var entity = Entity()
    var body: some View {
        VStack {
            RealityView { content in
                // Add the initial RealityKit content
                if let scene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
                    entity = scene
                    content.add(scene)
                }
            }
            .gesture(DragGesture().targetedToAnyEntity().onChanged{value in
                
                var vectorDouble = value.translation3D
                
                // Convert to SIMD3<Float>
                let vectorFloat = SIMD3<Float>(Float(vectorDouble.x/10000), Float(vectorDouble.y/10000), Float(vectorDouble.z/10000))
                
                value.entity.position = value.convert(value.location3D, from: .local, to: entity.parent!)
            })
        }}
}

#Preview {
    TranslateView()
}
