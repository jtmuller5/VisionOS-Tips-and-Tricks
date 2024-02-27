#  Request Permissions

> This example requires a real Vision Pro device. Scene reconstruction is not supported in the simulator

In order to access all of the data provided by the Vision Pro, you'll need to ask the user for specific permissions. The following table displays what data is available and the permission that's required to access it:

| Data Type | DataProvider | Authorization Permission |
| --- | --- | ---  |
| Hand Tracking | HandTrackingProvider | .handTracking |
| World Tracking | WorldTrackingProvider | .worldSensing |
| Scene Understanding | SceneReconstructionProvider | .worldSensing |
| Plane Detection | PlaneDetectionProvider | .worldSensing |


To request a permission or list of permissions, you first need to create an ARKitSession:
```swift
let session = ARKitSession()
```

With an ARKitSession initialized, you can now use that session to request the permissions, or "authorizations", your app needs:

```swift
Task {
    let authorizationResult = await session.requestAuthorization(for: [.handTracking, .worldSensing])
}
```

The result of this request will either be `approved` or `denied`.

You can later query for the status of a specific permission using this code:
```swift
func queryPermission(){
        let authorizationresult = await session.queryAuthorization(for: [.worldSensing])
}
```

> Note that if you do not request authorization explicitly before using these data types, VisionOS will request it for you
