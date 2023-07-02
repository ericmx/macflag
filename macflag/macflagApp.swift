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
    
    var body: some Scene {
        MenuBarExtra(currentFlag) {
            ForEach(menuBarFlag.indices, id: \.self) { index in
                Button(action: {
                    currentFlag = menuBarFlag[index]
                }) {
                    Text("\(menuBarFlag[index])")
                }
            }
        }
    }
}
