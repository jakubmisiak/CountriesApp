//
//  Country.swift
//  Countries
//
//  Created by Jakub Misiak on 09/10/2022.
//

import Foundation

struct Country : Codable, Identifiable {
    
    let name: Name
    let capital: [String]
    let region: String
    let subregion: String
    let area: Double
    let flag: String
    let population: Int
    let flags: CoatOfArms
    let id = UUID()
    //var currencyListToString: String {self.currencies.joined(separator: ", ")}
}

struct Name: Codable {
    let common, official: String
}
struct CoatOfArms: Codable {
    let png: String
    let svg: String
}
