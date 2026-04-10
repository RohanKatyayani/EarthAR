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
        
        // Configure AR session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        arView.session.run(config)
        
        // Load Earth texture and create sphere
        // Load Earth texture with fallback
        var material = SimpleMaterial()
        
        if let earthTexture = try? TextureResource.load(named: "earthday") {
            material.color = .init(texture: .init(earthTexture))
            print("✅ Earth texture loaded successfully")
        } else {
            // Fallback: green color so you can see something
            material.color = .init(tint: .green)
            print("❌ Could not load earthday texture - check filename and target membership")
        }
        
        let sphere = ModelEntity(
            mesh: .generateSphere(radius: 0.45),
            materials: [material]
        )
        
        // Position sphere 1 meter in front of camera
        let anchorEntity = AnchorEntity(world: [0, 0, -1.5])
        anchorEntity.addChild(sphere)
        arView.scene.addAnchor(anchorEntity)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
