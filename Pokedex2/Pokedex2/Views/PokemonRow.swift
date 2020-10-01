//
//  PokemonRow.swift
//  Pokedex2
//
//  Created by Kha-Yu Cheam on 10/1/20.
//

import SwiftUI

struct PokemonRow: View {
    @EnvironmentObject var pokedex: Pokedex
    let rowTitle : String
    let pokemonType: PokemonType?
    let pokemonImageSize : CGFloat = 120
    var pokemonIndices: [Int] {
        if let type = pokemonType {
            return pokedex.filterPokemon(for: {$0.types.contains(type)})
        } else {
            return pokedex.allPokemon.map({$0.id - 1})
        }
    }
    
    var body: some View {
        
        VStack {
            HeadingStyle(heading: rowTitle)
            ScrollView(.horizontal) {
                HStack(spacing: 30) {
                    ForEach(pokemonIndices, id: \.self) { index in
                        NavigationLink(
                            destination: PokemonDetailView(pokemon: $pokedex.allPokemon[index])){
                            PokemonItem(pokemon: $pokedex.allPokemon[index], size: pokemonImageSize)
                        }
                    }
                }
            }
            
        }
        
    }
    
}

//struct PokemonRow_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonRow()
//    }
//}
