#  Rotate a 3D Object

In VisionOS there is a [Rotate3DGesture](https://developer.apple.com/documentation/swiftui/rotategesture3d) that can be used to rotate models in 3D space:
```swift
            RealityView { content in
                if let scene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
                    entity = scene
                    content.add(scene)
                }
            }
            .gesture(TapGesture().targetedToAnyEntity().onEnded{ value in
                print("rotation: ", value.entity.transform.rotation)
                print("orientation: ", value.entity.orientation)
            })
            .gesture(RotateGesture3D(minimumAngleDelta: .degrees(10)).targetedToAnyEntity().onChanged{ value in
                
                value.entity.orientation = value.convert(value.rotation, from: .local, to: entity)
            })
```

Read [this answer](https://stackoverflow.com/a/76823868/12806961) for instructions on how to implement rotation using a DragGesture.
