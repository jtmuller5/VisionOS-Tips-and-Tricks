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


Many of these ornaments are discussed in the [Meet SwiftUI for spatial computing](https://developer.apple.com/videos/play/wwdc2023/10109/?time=72) video.
