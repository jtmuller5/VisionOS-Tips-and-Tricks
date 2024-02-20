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

       var body: some View {
           VStack {
               RealityView { content in
                         let model = ModelEntity(
                            mesh: .generateBox(size: 0.2),
                                      materials: [SimpleMaterial(color: .blue, isMetallic: true)])
                         content.add(model)
               }
           }
           .padding()
       }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
