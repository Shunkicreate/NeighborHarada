//
//  NeighborHaradaApp.swift
//  NeighborHarada
//
//  Created by Taishin Miyamoto on 2024/11/16.
//

import SwiftUI

@main
struct NeighborHaradaApp: App {
    
    init() {
        Unity.shared.start()
    }
    
    var body: some Scene {
        WindowGroup {
            TitleView()
        }
    }
}

import SwiftUI

struct UnityView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        return Unity.shared.view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
    }
}
