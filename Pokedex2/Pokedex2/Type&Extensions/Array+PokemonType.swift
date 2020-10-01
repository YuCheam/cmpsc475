//
//  Array+PokemonType.swift
//  Pokedex2
//
//  Created by Kha-Yu Cheam on 9/30/20.
//

import Foundation

extension Array {
    func foundPokemonType(for type: PokemonType) -> Bool {
        for pokemonType in self {
            if pokemonType as! PokemonType == type {
                return true
            }
        }
        return false
    }
    
}
