//
//  Day004App.swift
//  Day004
//
//  Created by Joseph Muller on 2/20/24.
//

import SwiftUI
import RealityKit

@Observable class DebugData {
    var dragTranslation : Vector3D = Vector3D(x:0, y:0, z:0) // For displaying drag translation
}

@Observable class Shapes {
    var shapes: [Entity] = []
    
    var cube = Entity()
    
    func resetCubePosition(){
        cube.position = SIMD3<Float>(0,1,-2)
    }
}

@main
struct Day004App: App {
    
    @State private var debugData = DebugData()
    @State private var shapes = Shapes()
    
    var body: some SwiftUI.Scene {
        WindowGroup {
            ContentView()
                .environment(debugData)
                .environment(shapes)
            
        }
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
                .environment(debugData)
                .environment(shapes)
        }
    }
}
