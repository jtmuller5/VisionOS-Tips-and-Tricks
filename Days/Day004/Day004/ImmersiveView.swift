//
//  ImmersiveView.swift
//  Day004
//
//  Created by Joseph Muller on 2/20/24.
//

import SwiftUI
import RealityKit


struct ImmersiveView: View {
    
    @State var model = Day004ViewModel()
    @State private var rotation = SIMD3<Float>(0, 0, 0)
    @State private var dragTranslation: SIMD3<Float> = SIMD3<Float>(0, 0, 0) // For displaying drag translation
    @Environment(Shapes.self) var shapes: Shapes
    @Environment(DebugData.self) var debugData: DebugData
    
    var body: some View {
        RealityView { content in
            content.add(model.setupContentEntity()!)
            shapes.cube = model.addCube(name: "Cube1")

            print("loade")
        }
        .gesture(DragGesture() // Add this gesture for moving the cube
            .onChanged { value in
                let dragTranslation = value.translation3D
                
                debugData.dragTranslation = value.translation3D
                
                // Assuming a simple mapping: dragging horizontally moves the cube along the X axis, and dragging vertically moves it along the Z axis.
                // Adjust the scale (0.01 in this example) to control the speed of the movement.
                let deltaX = Float(dragTranslation.x) * 0.0001
                let deltaZ = Float(dragTranslation.z) * 0.0001
                
                
                // Update cube's position
                shapes.cube.position = shapes.cube.position + SIMD3<Float>(deltaX, 0, deltaZ)
            })
        .gesture(SpatialTapGesture()
            .targetedToEntity(shapes.cube)
            .onEnded { value in
                model.changeToRandomColor(entity:shapes.cube)
            })
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}

//        .gesture(DragGesture()
//            .targetedToEntity(cube)
//            .onChanged { value in
//                print("Drag", value.location)
//                    let dragTranslationX = value.translation3D.x / 1000
//                    let dragTranslationY = value.translation3D.y / 1000
//                    let dragTranslationZ = value.translation3D.z / 1000
//
//                    rotation.x += Float(dragTranslationX)
//                    rotation.y += Float(dragTranslationY)
//                    rotation.z += Float(dragTranslationZ)
//
//                    // Create quaternions for each axis rotation
//                    let quatX = simd_quatf(angle: rotation.x, axis: SIMD3<Float>(1, 0, 0))
//                    let quatY = simd_quatf(angle: rotation.y, axis: SIMD3<Float>(0, 1, 0))
//                    let quatZ = simd_quatf(angle: rotation.z, axis: SIMD3<Float>(0, 0, 1))
//
//                    // Combine the rotations. The order of multiplication matters.
//                    // Commonly, rotation around Y (yaw) is applied first, then pitch (X), and roll (Z) last.
//                    // This order can be changed depending on the desired rotation behavior.
//                let combinedRotation = quatY * quatX * quatZ
//
//                    cube.transform.rotation = combinedRotation
//            })
