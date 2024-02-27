import SwiftUI
import RealityKit
import ARKit

@MainActor class ViewModel: ObservableObject {

    private let session = ARKitSession()
    let sceneReconstruction = SceneReconstructionProvider(modes: [.classification])
    private var contentEntity = Entity()
    private var sceneContent: RealityViewContent? = nil

    func runSession() async {

        print("WorldTrackingProvider.isSupported: \(WorldTrackingProvider.isSupported)")
        print("PlaneDetectionProvider.isSupported: \(PlaneDetectionProvider.isSupported)")
        print("SceneReconstructionProvider.isSupported: \(SceneReconstructionProvider.isSupported)")
        print("HandTrackingProvider.isSupported: \(HandTrackingProvider.isSupported)")

        // Task initializer
        Task {
            let authorizationResult = await session.requestAuthorization(for: [.worldSensing, .handTracking])
            
            for (authorizationType, authorizationStatus) in authorizationResult {
                print("Authorization status for \(authorizationType): \(authorizationStatus)")
                switch authorizationStatus {
                case .allowed:
                    break
                case .denied:
                    // Need to handle this.
                    break
                case .notDetermined:
                    break
                @unknown default:
                    break
                }
            }
        }
    }
    
    func queryPermission(){
        let authorizationresult = await session.queryAuthorization(for: [.worldSensing])
    }
}
