//
//  Flag.swift
//  macflag
//
//  Created by Eric May on 6/26/22.
//

import Foundation

struct CountryFlag: Identifiable {
    let name: String
    let assetName: String

    var id: String { assetName }
}

struct FlagData {
    static let special: [CountryFlag] = [
        CountryFlag(name: "Pirate Flag", assetName: "flag_pirate"),
        CountryFlag(name: "Pride Flag", assetName: "flag_pride"),
        CountryFlag(name: "Transgender Pride Flag", assetName: "flag_trans"),
        CountryFlag(name: "Checkered Flag", assetName: "flag_checkered"),
        CountryFlag(name: "Black Flag", assetName: "flag_black"),
        CountryFlag(name: "White Flag", assetName: "flag_white"),
    ]

    static let countries: [CountryFlag] = [
        CountryFlag(name: "Canada", assetName: "flag_ca"),
        CountryFlag(name: "France", assetName: "flag_fr"),
        CountryFlag(name: "Germany", assetName: "flag_de"),
        CountryFlag(name: "Japan", assetName: "flag_jp"),
        CountryFlag(name: "United Kingdom", assetName: "flag_gb"),
        CountryFlag(name: "United States", assetName: "flag_us"),
    ]

    static var all: [CountryFlag] {
        special + countries
    }
}
