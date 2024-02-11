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
               Model3D(named: "Globe") { model in
                  model
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .frame(width: 200, height: 200)
                      } placeholder: {
                  ProgressView()
               }
           }
           .padding()
       }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
