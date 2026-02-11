//
//  macflagApp.swift
//  macflag
//
//  Created by Eric May on 6/17/22.
//

import SwiftUI

@main
struct MacFlag: App {
    @AppStorage("selectedFlag") private var currentFlag = "🏴‍☠️"
    @State private var searchText = ""

    private var filteredFlags: [CountryFlag] {
        if searchText.isEmpty {
            return FlagData.all
        }
        return FlagData.all.filter { flag in
            flag.name.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some Scene {
        MenuBarExtra {
            FlagMenuContent(
                searchText: $searchText,
                currentFlag: $currentFlag,
                filteredFlags: filteredFlags
            )
        } label: {
            Text(currentFlag)
        }
        .menuBarExtraStyle(.window)
    }
}

struct FlagMenuContent: View {
    @Binding var searchText: String
    @Binding var currentFlag: String
    let filteredFlags: [CountryFlag]

    var body: some View {
        VStack(spacing: 0) {
            TextField("Search flags...", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .padding(8)

            Divider()

            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(filteredFlags) { flag in
                        Button(action: {
                            currentFlag = flag.emoji
                        }) {
                            HStack {
                                Text(flag.emoji)
                                    .font(.title2)
                                Text(flag.name)
                                    .lineLimit(1)
                                Spacer()
                                if currentFlag == flag.emoji {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.accentColor)
                                }
                            }
                            .contentShape(Rectangle())
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }

            Divider()

            Button(action: {
                NSApplication.shared.terminate(nil)
            }) {
                HStack {
                    Text("Quit")
                    Spacer()
                    Text("⌘Q")
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
            }
            .buttonStyle(.plain)
            .keyboardShortcut("q")
        }
        .frame(width: 280, height: 400)
    }
}
