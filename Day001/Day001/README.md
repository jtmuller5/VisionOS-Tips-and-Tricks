#  Display Text
This one is super easy. Just create a new `visionOS` app in Xcode and run the app either on the simulator or in the Xcode preview.

```swift
import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
```
