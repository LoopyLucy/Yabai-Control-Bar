//
//  Yabai_ControlApp.swift
//  Yabai Control
//
//  Created by Erin Fitton on 14/02/2023.
//

import SwiftUI

@main
struct Yabai_ControlApp: App {
    @State var tiled: Bool = true

    var body: some Scene {

        MenuBarExtra("Yabai Control", image: tiled ? "Tiled" : "Loose") {
            
            Button("Start Yabai") {
                tiled = true
            }
            
            Button("Stop Yabai") {
                tiled = false
            }
            
            Button("Reset Yabai") {
                
            }
            
            Divider()
            
            Button("Open Settings") {
                
            }
            
            Divider()
            
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }
    }
}
