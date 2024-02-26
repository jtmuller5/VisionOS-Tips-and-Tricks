//
//  TypeView.swift
//  Day007
//
//  Created by Joseph Muller on 2/25/24.
//

import SwiftUI

struct TypeView: View {
    
    var id: Int
    
    init(_ id: Int) {
        self.id = id
    }
    
    var body: some View {
        Text("By Type: \(id)")
    }
}

#Preview {
    TypeView(1)
}
