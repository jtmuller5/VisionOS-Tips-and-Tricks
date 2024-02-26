#  Open Multiple Windows

Goal: Open multiple windows of different types

You can open a new window using the [openWindow](https://developer.apple.com/documentation/swiftui/environmentvalues/openwindow) environment property.

To start, define your window in the app's Scene and give it an `id`:

```swift
@main
struct Mail: App {
    var body: some Scene {
        WindowGroup(id: "mail-viewer") {
            MailViewer()
        }
    }
}
```

Then, in a view, retrieve the openWindow environment value and call it using the `id` from above:
```swift
struct NewViewerButton: View {
    @Environment(\.openWindow) private var openWindow


    var body: some View {
        Button("Open new mail viewer") {
            openWindow(id: "mail-viewer")
        }
    }
}
```

You can also open multiple copies of a window with different input values. First define the view with an input argument:
```swift
struct TypeView: View {
    
    var id: Int
    
    init(_ id: Int) {
        self.id = id
    }
    
    var body: some View {
        Text("By Type: \(id)")
    }
}
```

Then, in your main scene, define the WindowGroup:
```swift
@main
struct Day007App: App {
    var body: some Scene {
        
        WindowGroup() {
            ContentView()
        }
        
        WindowGroup(id: "type-view", for: Int.self) { $id in
            TypeView(id!)
        }
    }
}
```

You can now open the window from another view by passing a value in to the openWindow method:

```swift
struct ContentView: View {
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        VStack {
            Button("Open new window by type") {
                openWindow(id: "type-view", value: 1)
            }
            Button("Open new window by type") {
                openWindow(id: "type-view", value: 2)
            }
        }
    }
}

```

This [article](https://swiftwithmajid.com/2022/11/02/window-management-in-swiftui/) contains more information about window management in Swift.

> Note that the [Window](https://developer.apple.com/documentation/swiftui/window) structure is unavailable in VisionOS
