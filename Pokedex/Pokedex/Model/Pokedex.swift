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
    let types: [PokemonType]
    let height: Float
    let weight: Float
    let weaknesses: [PokemonType]
    let prev_evolution: [Int]?
    let next_evolution: [Int]?
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
    
    func getPokemon(index: Int) -> Pokemon {
        return allPokemon[index]
    }
}
