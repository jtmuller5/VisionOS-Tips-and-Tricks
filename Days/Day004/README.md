#  Translate a 3D Object
Gestures can be added to RealityViews to allow your users to interact with 3D Models. In this demo, you'll use drag gestures to move a cube within a 2D plane.

The gesture code is here:
```swift
        RealityView { content in
            content.add(model.setupContentEntity()!)
            shapes.cube = model.addCube(name: "Cube1")

            print("loade")
        }
        .gesture(DragGesture() // Add this gesture for moving the cube
            .onChanged { value in
                let dragTranslation = value.translation3D
                
                debugData.dragTranslation = value.translation3D
                
                // Assuming a simple mapping: dragging horizontally moves the cube along the X axis, and dragging vertically moves it along the Z axis.
                // Adjust the scale (0.01 in this example) to control the speed of the movement.
                let deltaX = Float(dragTranslation.x) * 0.0001
                let deltaZ = Float(dragTranslation.z) * 0.0001
                
                
                // Update cube's position
                shapes.cube.position = shapes.cube.position + SIMD3<Float>(deltaX, 0, deltaZ)
            })
```
