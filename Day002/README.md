#  Display 3D Object

You can display 3D objects from `.usdz` or `.reality` files using RealityView or Model3D. Find a list of sample models [here](https://developer.apple.com/augmented-reality/quick-look/).

## RealityView

You can use the [RealityView](https://developer.apple.com/documentation/RealityKit/RealityView) view from RealityKit to display 3D objects.

```swift
RealityView { content in
          let model = ModelEntity(
                       mesh: .generateSphere(radius: 0.1),
                       materials: [SimpleMaterial(color: .white, isMetallic: true)])
          content.add(model)
}
```

You can update the mesh property to create all sorts of shapes.

```swift
mesh: .generateCone(height: 1, radius: 0.2),

mesh: .generateSphere(radius: 0.1),

mesh: .generateCylinder(height: 1, radius: 0.1),

mesh: .generatePlane(width: 4, depth: 0.1),
```

You can also choose from several material types to change how the 3D shape is displayed:
- [SimpleMaterial](https://developer.apple.com/documentation/realitykit/simplematerial)
- [UnlitMaterial](https://developer.apple.com/documentation/realitykit/unlitmaterial)
- [OcclusionMaterial](https://developer.apple.com/documentation/realitykit/occlusionmaterial)
- [PhysicallyBasedMaterial](https://developer.apple.com/documentation/realitykit/physicallybasedmaterial)

You can read the official documentation on [Adding 3D content to your app](https://developer.apple.com/documentation/visionos/adding-3d-content-to-your-app/) for more information.

## [Model3D](https://developer.apple.com/documentation/realitykit/model3d/)

You can display a 3D model from a URL or from your app's assets. To display one from a URL, link directly to the `.usdz` file:
```swift

private let url = URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/teapot/teapot.usdz")!
       
Model3D(url: url) { model in
   model
       .resizable()
       .aspectRatio(contentMode: .fit)
       .frame(width: 200, height: 200)
       } placeholder: {
   ProgressView()
}
```
To display on object from your app's assets,first add the file to your app by selecting File > Add Files To... and then selecting your models. You can add these models to a nested `Assets` folder to stay organized. In your app you can reference the models by name:
```swift
Model3D(named: "Globe") { model in
  model
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: 200, height: 200)
      } placeholder: {
  ProgressView()
}
```
