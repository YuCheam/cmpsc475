//
//  Pokedex.swift
//  Pokedex
//
//  Created by Kha-Yu Cheam on 9/22/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import Foundation

struct Pokemon: Codable, Hashable {
    let id: Int 
    let name: String
    let types: [PokemonType]
    let height: Float
    let weight: Float
    let weaknesses: [PokemonType]
    let prev_evolution: [Int]?
    let next_evolution: [Int]?
    var captured: Bool
}

typealias AllPokemon = [Pokemon]

class Pokedex: ObservableObject {
    @Published var allPokemon: [Pokemon]
    let destinationURL : URL
    
    init() {
        let filename = "pokedex-v2"
        let mainBundle = Bundle.main
        let bundleURL = mainBundle.url(forResource: filename, withExtension: "json")!
        
        let fileManager = FileManager.default
        let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        destinationURL = documentURL.appendingPathComponent(filename + ".json")
        let fileExists = fileManager.fileExists(atPath: destinationURL.path)
        
        do {
            let url = fileExists ? destinationURL : bundleURL
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            allPokemon = try decoder.decode(AllPokemon.self, from: data)
        } catch {
            print("Error info: \(error)")
            allPokemon = []
        }
    }
    
    func saveData() {
        let encoder = JSONEncoder()
        do {
            let data  = try encoder.encode(allPokemon)
            try data.write(to: self.destinationURL)
        } catch  {
            print("Error writing: \(error)")
        }
    }
    
    func filterPokemon(for property: (Pokemon)-> Bool ) -> [Int] {
        return allPokemon.filter(property).map({$0.id - 1})
    }
    
    func getPokemon(index: Int) -> Pokemon {
        return allPokemon[index]
    }
}
