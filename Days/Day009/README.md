#  View the World Mesh

> This example requires a real Vision Pro device. Scene reconstruction is not supported in the simulator

The official Apple tutorials for this feature can be found [here](https://developer.apple.com/documentation/visionos/incorporating-real-world-surroundings-in-an-immersive-experience) and [here](https://developer.apple.com/documentation/arkit/arkit_in_ios/content_anchors/visualizing_and_interacting_with_a_reconstructed_scene).

To get started, add the following lines to `info.plist`:
```
    <key>NSWorldSensingUsageDescription</key>
    <string>Get world data</string>
    <key>NSHandsTrackingUsageDescription</key>
    <string>Get hand data</string>
```

Scene meshes consist of [MeshAnchors](https://developer.apple.com/documentation/arkit/meshanchor) which will be provided by the SceneReconstructionProvider. Each MeshAnchor contains the following data:

```
AnchorUpdate(
    event: updated, 
    timestamp: 241073.4272435, 
    anchor: MeshAnchor(
        id: 9B52EEF4-565F-4685-BAC1-E6B12AD69752, 
        originFromAnchorTransform: <
            translation=(-8.627284 10.236238 0.091287) 
            rotation=(-0.02° 80.17° -0.02°)
        >, 
        geometry: Geometry(
            vertices: 
                GeometrySource(
                    count: 2139, 
                    format: 
                        MTLVertexFormat(
                            rawValue: 30
                        )), 
                    normals: 
                        GeometrySource(
                            count: 2139, 
                            format: 
                                MTLVertexFormat(
                                    rawValue: 30)), 
                            faces: 
                                GeometryElement(
                                    count: 3764, 
                                    primitive: triangle), 
                            classifications: 
                                GeometrySource(
                                    count: 3764, 
                                        format: 
                                            MTLVertexFormat(
                                                rawValue: 45)
                                            )
                                )
                        )
                )
```
