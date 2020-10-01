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
    let property : (Pokemon) -> Bool
    let pokemonImageSize : CGFloat = 120
    var pokemonIndices: [Int] { pokedex.filterPokemon(for: property)}
    
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
