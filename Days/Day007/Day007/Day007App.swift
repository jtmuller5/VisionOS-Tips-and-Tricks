//
//  Day007App.swift
//  Day007
//
//  Created by Joseph Muller on 2/25/24.
//

import SwiftUI

@main
struct Day007App: App {
    var body: some Scene {
        
        WindowGroup() {
            ContentView()
        }
        
        WindowGroup(id: "mail-viewer") {
            MailViewerView()
        }
        
        WindowGroup(id: "type-view", for: Int.self) { $id in
            TypeView(id!)
        }
    }
}
