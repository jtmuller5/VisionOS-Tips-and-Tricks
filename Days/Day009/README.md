# Place Objects Relative to the User

Goal: Add objects to the scene with coordinates relative to the user

![image](https://github.com/jtmuller5/VisionOS-Tips-and-Tricks/assets/47997351/f9de8204-218e-48b9-9e81-ec99a7efc37c)

3D models can be moved around within Volumes (windows with the [Volumetric](https://developer.apple.com/documentation/SwiftUI/WindowStyle/volumetric) window style) and [ImmersiveSpaces](https://developer.apple.com/documentation/SwiftUI/ImmersiveSpace).

**Volumes - Window**
> Add depth to your app with a 3D volume. Volumes are SwiftUI scenes that can showcase 3D content using RealityKit or Unity, creating experiences that are viewable from any angle in the Shared Space or an app’s Full Space.

**Spaces - Scene**
> By default, apps launch into the Shared Space, where they exist side by side — much like multiple apps on a Mac desktop. Apps can use windows and volumes to show content, and the user can reposition these elements wherever they like. For a more immersive experience, an app can open a dedicated Full Space where only that app’s content will appear. Inside a Full Space, an app can use windows and volumes, create unbounded 3D content, open a portal to a different world, or even fully immerse people in an environment.

## In a Volumetric Window
You can create a volumetric window by giving your window a `volumetric` style:
```swift
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)
    }
```

Inside of this volume, you can position 3D objects a few ways using the [position](https://developer.apple.com/documentation/swiftui/view/position(x:y:) and [offset](https://developer.apple.com/documentation/swiftui/view/offset(z:) modifiers. These modifiers position the center of a view inside its parent's coordinate space. Inside the volume, the coordinate (0, 0, 0) refers to the left, upper, rear corner, respectively. In other words: 
- Increasing the x value moves the object to the right
- Increasing the y value moves the object down
- Increasing the z value moves the object towards the user

```swift
    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .position(x: 300,y: 500)
                .offset(z: 400)
            
            Text("Hello, world!")
        }
    }
```

Refer to this article on [Making fine adjustments to a view's position](https://developer.apple.com/documentation/swiftui/making-fine-adjustments-to-a-view-s-position) for more info.

## In a RealityView
It is more likely that you'll be handling 3D content inside of a RealityView. After creating a ModelEntity, you can change its position relative to its parent using its `position` property:

```swift
    var body: some View {
        RealityView{ content in
            let sphere : Entity = ModelEntity(
                mesh: .generateSphere(radius: 0.1),
                materials: [SimpleMaterial(color: .blue, isMetallic: false)]
            )
            
            sphere.position = SIMD3(0.4,0,0)
            content.add(sphere)
        }
    }
```
The coordinate system works the same in a RealityView with positive x being to the right, positive y being down, and positive z being towards the user.
