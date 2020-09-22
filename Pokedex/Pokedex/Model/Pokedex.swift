//
//  Pokedex.swift
//  Pokedex
//
//  Created by Kha-Yu Cheam on 9/22/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    let id: Int
    let name: String
    let types: [String]
    let height: Float
    let weight: Float
    let weaknesses: [String]
    let prev_evolution: [Int]
    let next_evolution: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case types
        case height
        case weight
        case weaknesses
        case prev_evolution
        case next_evolution
    }
}

typealias AllPokemon = [Pokemon]

struct Pokedex {
    var allPokemon: [Pokemon]
    
    init() {
        let filename = "pokedex"
        let mainBundle = Bundle.main
        let jsonURL = mainBundle.url(forResource: filename, withExtension: "json")!
        
        do {
            let data = try Data(contentsOf: jsonURL)
            let decoder = JSONDecoder()
            allPokemon = try decoder.decode(AllPokemon.self, from: data)
        } catch {
            print("Error info: \(error)")
            allPokemon = []
        }
    }
}
