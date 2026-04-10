//
//  ARViewContainer.swift
//  EarthAR
//
//  Created by Rohan Katyayani on 11/04/26.
//

//
//  ARViewContainer.swift
//  EarthAR
//
//  Created by Rohan Katyayani on 11/04/26.
//

import SwiftUI
import ARKit
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // MARK: - AR Configuration
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        arView.session.run(config)
        
        // MARK: - Material (Earth Texture)
        var material = SimpleMaterial()
        
        if let earthTexture = try? TextureResource.load(named: "earthday") {
            material.color = .init(texture: .init(earthTexture))
            print("✅ Earth texture loaded")
        } else {
            material.color = .init(tint: .green)
            print("❌ Failed to load texture")
        }
        
        // MARK: - Sphere (Earth)
        let sphere = ModelEntity(
            mesh: .generateSphere(radius: 0.45),
            materials: [material]
        )
        
        // MARK: - Anchor
        let anchorEntity = AnchorEntity(world: [0, 0, -1.5])
        anchorEntity.addChild(sphere)
        arView.scene.addAnchor(anchorEntity)
        
        // MARK: - Start Rotation
        rotateEarth(entity: sphere)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    // MARK: - Rotation Logic 🌍
    func rotateEarth(entity: Entity) {
        // Earth tilt (~23.5°) for realism
        let axis = normalize(SIMD3<Float>(0, 1, 0.4))
        
        // Rotate 180 degrees each cycle
        let rotation = simd_quatf(angle: .pi, axis: axis)
        
        var transform = entity.transform
        transform.rotation = transform.rotation * rotation
        
        entity.move(
            to: transform,
            relativeTo: entity.parent,
            duration: 10, // speed (lower = faster)
            timingFunction: .linear
        )
        
        // Loop forever
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            rotateEarth(entity: entity)
        }
    }
}
