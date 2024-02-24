#  Add Gestures to Models

You can make 3D models and RealityViews [respond to user interaction](https://developer.apple.com/documentation/visionos/adding-3d-content-to-your-app#Respond-to-interactions-with-RealityKit-content) using Gestures. 

To begin, add the [CollisionComponent](https://developer.apple.com/documentation/RealityKit/CollisionComponent) to your entity. This component "gives an entity the ability to collide with other entities".

```swift
                model.components.set(CollisionComponent(
                    shapes: [.generateBox(width: 0.2, height: 1, depth: 0.2)],
                    mode: .colliding, // colliding, default, trigger
                    filter: .default
                ))
```

The CollisionComponent can have one of the following [shapes](https://developer.apple.com/documentation/realitykit/shaperesource):
- Sphere ([.generateSphere](https://developer.apple.com/documentation/realitykit/shaperesource/generatesphere(radius:)))
- Capsule ([.generateCapsule](https://developer.apple.com/documentation/realitykit/shaperesource/generatecapsule(height:radius:)))
- Box ([.generateBox](https://developer.apple.com/documentation/realitykit/shaperesource/generatebox(size:)))
- Convex Shape ([.generateConvex](https://developer.apple.com/documentation/realitykit/shaperesource/generateconvex(from:)-6q0wj))

Next, add a gesture to the RealityView. The following gestures are available:
- [TapGesture](https://developer.apple.com/documentation/swiftui/tapgesture): Gesture that recognizes one or more taps
- [SpatialTapGesture](https://developer.apple.com/documentation/swiftui/spatialtapgesture): A gesture that recognizes one or more taps and reports their location.
- [LongPressGesture](https://developer.apple.com/documentation/swiftui/longpressgesture): A gesture that succeeds when the user performs a long press.
- [SpatialEventGesture](https://developer.apple.com/documentation/swiftui/spatialeventgesture)
- [DragGesture](https://developer.apple.com/documentation/swiftui/draggesture): A dragging motion that invokes an action as the drag-event sequence changes.
- [MagnifyGesture](https://developer.apple.com/documentation/swiftui/magnifygesture): A gesture that recognizes a magnification motion and tracks the amount of magnification.
- [RotateGesture](https://developer.apple.com/documentation/swiftui/rotategesture): A gesture that recognizes a rotation motion and tracks the angle of the rotation.
- [RotateGesture3D](https://developer.apple.com/documentation/swiftui/rotategesture3d): A gesture that recognizes 3D rotation motion and tracks the angle and axis of the rotation.
- [SequenceGesture](https://developer.apple.com/documentation/swiftui/sequencegesture): A gesture that’s a sequence of two gestures.

```swift
            RealityView{ content in
                let model = ModelEntity(
                    mesh: .generateCylinder(height: 1, radius: 0.1),
                    materials: [
                        SimpleMaterial(color: .red, isMetallic: true),
                    ])
                
                model.components.set(InputTargetComponent())
                model.components.set(CollisionComponent(
                    shapes: [.generateBox(width: 0.2, height: 1, depth: 0.2)],
                    mode: .colliding,
                    filter: .default
                ))
                content.add(model)
            } update: { content in
                if let model = content.entities.first {
                    model.transform.scale = scale ? [1.2, 1.2, 1.2]: [ 1.0, 1.0, 1.0]
                }
            }
            .gesture( LongPressGesture().targetedToAnyEntity().onEnded { _ in
                scale.toggle()
            })
```

