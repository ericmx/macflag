# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

macflag is a macOS menu bar application that displays a user-selected flag emoji in the system menu bar. Built with SwiftUI targeting macOS 14.0+ (Sonoma).

## Build Commands

Build and run via Xcode:
```bash
open macflag/macflag.xcodeproj
```

Or from command line:
```bash
xcodebuild -project macflag/macflag.xcodeproj -scheme macflag build
```

## Architecture

This is a minimal SwiftUI menu bar app with two source files:

- **macflagApp.swift** - App entry point using `MenuBarExtra` to render the menu bar item and dropdown menu
- **Flag.swift** - Data model containing the array of 249+ country/territory flag emojis

The app uses `MenuBarExtra` (introduced in macOS 13) to create a persistent menu bar presence. The current flag selection is stored in `@State` and displayed directly in the menu bar.

## Key Technical Details

- App is sandboxed with read-only file access (see `macflag.entitlements`)
- No external dependencies - pure SwiftUI
- Target: Mac App Store distribution
