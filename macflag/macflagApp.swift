//
//  macflagApp.swift
//  macflag
//
//  Created by Eric May on 6/17/22.
//

import SwiftUI

@main
struct MacFlag: App {
        
    var flagTest = Flag().flags
    @State var currentFlag = "🏴‍☠️"

    var body: some Scene {
        MenuBarExtra(currentFlag) {
            ForEach(flagTest.indices) { flag in
                Button(action: {
                    currentFlag = flagTest[flag]
                })
                {
                    Text("\(flagTest[flag])")
                }
            }
        }
    }
}
