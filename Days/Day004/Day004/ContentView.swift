//
//  ContentView.swift
//  Day004
//
//  Created by Joseph Muller on 2/20/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State var showImmersiveSpace = false

        @Environment(\.openImmersiveSpace) var openImmersiveSpace
        @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

  
    @Environment(DebugData.self) var debugData: DebugData
    @Environment(Shapes.self) var shapes: Shapes
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("X: \(debugData.dragTranslation.x)")
                    .font(.largeTitle)
                
                Text("Y: \(debugData.dragTranslation.y)")
                    .font(.largeTitle)

                Text("Z: \(debugData.dragTranslation.z)")
                    .font(.largeTitle)
                Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
                                    .toggleStyle(.button)
                Button("Reset") {
                    shapes.resetCubePosition()
                }
            }.onChange(of: showImmersiveSpace) { _, newValue in
                Task {
                    if newValue {
                        await openImmersiveSpace(id: "ImmersiveSpace")
                    } else {
                        await dismissImmersiveSpace()
                    }
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
