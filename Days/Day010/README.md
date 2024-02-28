#  Add Ornaments

https://swiftwithmajid.com/2024/01/30/visionos-ornaments-in-swiftui/

## Toolbar

```swift
    var body: some View {
        VStack {
            
            Text("Plank Timer")
            Spacer()
            
        }
        .toolbar(content: {
            ToolbarItem(placement: .bottomOrnament) {
                Button("New", systemImage: "play") {
                    // new action
                }
            }
            ToolbarItem(placement: .bottomOrnament) {
                Button("New", systemImage: "pause") {
                    // new action
                }
            }
        })
        .padding()
    }
```

## [TabView](https://developer.apple.com/documentation/swiftui/tabview)

![image](https://github.com/jtmuller5/VisionOS-Tips-and-Tricks/assets/47997351/09c8645c-3a76-4a07-8d02-fca6490e5226)



Many of these ornaments are discussed in the [Meet SwiftUI for spatial computing](https://developer.apple.com/videos/play/wwdc2023/10109/?time=72) video.
