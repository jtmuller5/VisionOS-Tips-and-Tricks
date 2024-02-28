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
