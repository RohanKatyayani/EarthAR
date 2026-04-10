//
//  ContentView.swift
//  EarthAR
//
//  Created by Rohan Katyayani on 11/04/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ARViewContainer()
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
