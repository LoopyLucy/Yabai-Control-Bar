//
//  ContentView.swift
//  Yabai Control
//
//  Created by Erin Fitton on 14/02/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isTiled") var isTiled: Bool = true
    
    var body: some View {
        VStack {
            
            Form {
                Toggle("Tile Windows", isOn: $isTiled)
                    .toggleStyle(SwitchToggleStyle(tint: .blue))
                    .onChange(of: isTiled) { value in
                        if value {
                            do { try safeShell("yabai --start-service") } catch {}
                            
                        } else {
                            do { try safeShell("yabai --stop-service") } catch {}
                        }
                        
                    }
            }
            
            Divider()
            
            Button("Reset Yabai") {
                do { try safeShell("yabai --restart-service") } catch {}
            }
            
            Button("Open Yabai Settings") {
                do { try safeShell("open -t ~/.config/yabai/yabairc") } catch {}
            }
            
            Divider()
            
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }.frame(width: 200, height: 150)
        

    }
}

@discardableResult
    func safeShell(_ command: String) throws -> String {
        let task = Process()
        let pipe = Pipe()
        
        task.standardOutput = pipe
        task.standardError = pipe
        task.arguments = ["--login", "-c", command]
        task.executableURL = URL(fileURLWithPath: "/bin/zsh") //<--updated
        task.standardInput = nil

        try task.run() //<--updated
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!
        
        return output
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
