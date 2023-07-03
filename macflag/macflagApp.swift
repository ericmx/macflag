//
//  macflagApp.swift
//  macflag
//
//  Created by Eric May on 6/17/22.
//

import SwiftUI

@main
struct MacFlag: App {
        
    var menuBarFlag = Flag().flags
    @State var currentFlag = "🏴‍☠️"
    @State var isDockdisabled = false
    
    var body: some Scene {
        MenuBarExtra(currentFlag) {
            Button(action: {
                toggleDockIconEnabled(isDockdisabled)
            }) {
                Text("Toggle dock icon")
            }
            ForEach(menuBarFlag.indices, id: \.self) { index in
                Button(action: {
                    currentFlag = menuBarFlag[index]
                }) {
                    Text("\(menuBarFlag[index])").font(.title)
                }
            }
        }
    }
    
    func toggleDockIconEnabled(_ isEnabled: Bool) {
        NSApp.setActivationPolicy(isEnabled ? .regular : .accessory)
    }

}
