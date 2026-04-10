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
        guard let earthTexture = try? TextureResource.load(named: "earthday") else {
            print("Failed to load earthday texture")
            return arView
        }
        
        var material = SimpleMaterial()
        material.color = .init(texture: .init(earthTexture))
        
        let sphere = ModelEntity(
            mesh: .generateSphere(radius: 0.25),
            materials: [material]
        )
        
        // Position sphere 1 meter in front of camera
        let anchorEntity = AnchorEntity(world: [0, 0, -1])
        anchorEntity.addChild(sphere)
        arView.scene.addAnchor(anchorEntity)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
