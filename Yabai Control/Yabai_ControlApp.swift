//
//  Yabai_ControlApp.swift
//  Yabai Control
//
//  Created by Erin Fitton on 14/02/2023.
//

import SwiftUI

@main
struct Yabai_ControlApp: App {
    @AppStorage("isTiled") var isTiled: Bool = true
    
    var body: some Scene {
        MenuBarExtra {
            ContentView()
        } label: {
            Label("", image: isTiled ? "Tiled" : "Loose")
        }
        .menuBarExtraStyle(.window)
    }
}
