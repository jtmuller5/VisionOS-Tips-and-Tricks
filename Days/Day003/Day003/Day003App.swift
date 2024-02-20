//
//  Day003App.swift
//  Day003
//
//  Created by Joseph Muller on 2/14/24.
//

import SwiftUI

@main
struct Day003App: App {
    var body: some Scene {
        WindowGroup (id: "Starting Window"){
            ContentView()
        }.defaultSize(CGSize(width: 600, height: 450))
        
        
        WindowGroup(id: "Window 1"){
            SampleView(color: .blue, text: "Window 1")
        }
        
        WindowGroup(id: "Window 2"){
            SampleView(color: .red, text: "Window 2")
        }
    }
}
