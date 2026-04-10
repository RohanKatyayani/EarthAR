# 🌍 EarthAR

An immersive iOS augmented reality app that places a photorealistic Earth in your physical space.

![Platform](https://img.shields.io/badge/platform-iOS-blue)
![Swift](https://img.shields.io/badge/swift-5.9-orange)
![ARKit](https://img.shields.io/badge/ARKit-RealityKit-red)
![License](https://img.shields.io/badge/license-MIT-green)

## 📱 Overview

EarthAR brings our planet into your room using Apple's ARKit and RealityKit frameworks. Simply open the app, and watch a high-resolution 8K Earth materialize 1 meter in front of you.

## ✨ Features

- 🎯 **Automatic AR initialization** - Opens directly into AR mode
- 🌐 **8K Earth texture** - High-resolution NASA-based imagery
- 📍 **Precise positioning** - Appears exactly 1 meter from camera
- 🎨 **True-to-life colors** - Based on real satellite imagery
- 📱 **Pure SwiftUI** - Modern iOS architecture

## 📸 Screenshot

<img width="590" height="1278" alt="IMG_8649" src="https://github.com/user-attachments/assets/eaa767d5-8135-44ce-9eda-51abf6c44e35" />

## 🛠️ Requirements

- iOS 15.0+
- iPhone or iPad with A9 chip or later (ARKit compatible)
- Xcode 14.0+
- Swift 5.9+
- Real iOS device (simulator does not support camera AR)

## 🚀 Installation

### Clone the repository

```bash

git clone https://github.com/RohanKatyayani/EarthAR.git

cd EarthAR

Open in Xcode

open EarthAR.xcodeproj

Build and run

Connect your iOS device via USB

Select your device as the build target

Press Cmd + R or click the play button

Grant camera permissions when prompted
```

## 🎮 Usage

Launch the app on your iOS device

Point your camera around the room to let AR initialize

Earth will appear 1 meter in front of you

Walk around it to see all angles

The Earth texture loads in stunning 8K resolution

## 🧱 Technical Stack

Technology	  Purpose
SwiftUI	      User interface structure
ARKit	        Camera tracking and world sensing
RealityKit	  3D rendering and model generation
Metal	        High-performance graphics backend

EarthAR/
├── EarthAR/
│   ├── ContentView.swift          # Main AR container integration
│   ├── ARViewContainer.swift      # AR session and Earth model setup
│   ├── Info.plist                 # Camera permissions configuration
│   └── earthday.jpg               # 8K Earth texture image
├── EarthAR.xcodeproj/             # Xcode project
└── README.md                      # This file

## 🔧 How It Works
AR Session Initialization - ARWorldTrackingConfiguration() tracks device movement

Texture Loading - 8K Earth image loaded as TextureResource

3D Model Creation - Sphere mesh generated with 0.25m radius

Spatial Positioning - AnchorEntity places Earth 1 meter from camera

Real-time Rendering - RealityKit renders at 60 FPS

## 🌟 Earth Texture Credit
Earth textures provided by Solar System Scope, based on NASA elevation and imagery data.

License: Attribution 4.0 International (CC BY 4.0)

You may use, adapt, and share these textures for any purpose, even commercially

## 📄 License
This project is open source. Textures are used under CC BY 4.0 license.

## 🤝 Contributing
Contributions are welcome! Ideas for improvement:

Add cloud layer overlay

Implement pinch-to-zoom distance scaling

Add atmospheric glow effects

Support for other planets

Add rotation animation

## 🐛 Known Issues
First launch requires camera permission grant

8K texture may take 1-2 seconds to load on older devices

Requires good lighting for optimal AR tracking

## 📬 Contact
Rohan Katyayani - GitHub
rohankatyayani@gmail.com

## 🙏 Acknowledgments
NASA for the original Earth imagery

Solar System Scope for texture processing and distribution

Apple's ARKit and RealityKit teams

Made with 🌍 using SwiftUI and ARKit

*Version 1.0 - Initial Release*
