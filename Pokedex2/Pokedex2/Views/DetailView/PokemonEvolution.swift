//
//  PokemonEvolution.swift
//  Pokedex2
//
//  Created by Kha-Yu Cheam on 9/30/20.
//

import SwiftUI

struct PokemonEvolution: View {
    @EnvironmentObject var pokedex: Pokedex
    let pokemon: Pokemon
    let previousEvolution : [Int]
    let nextEvolution : [Int]
    let imageSize : CGFloat = 100
    
    var body: some View {
        
        HeadingStyle(heading: "Previous Evolution")
        ScrollView(.horizontal){
            HStack{
                ForEach(previousEvolution, id: \.self) { index in
                    NavigationLink(
                        destination: PokemonDetailView(pokemon: $pokedex.allPokemon[index])){
                        PokemonItem(pokemon: $pokedex.allPokemon[index], imageSize: imageSize)
                    }
                }
            }
        }
        
        HeadingStyle(heading: "Next Evolution")
        ScrollView(.horizontal){
            HStack{
                ForEach(nextEvolution, id: \.self) { index in
                    NavigationLink(
                        destination: PokemonDetailView(pokemon: $pokedex.allPokemon[index])){
                        PokemonItem(pokemon: $pokedex.allPokemon[index], imageSize: imageSize)
                    }

                }
            }
        }
        
    }
    
    init(_ pokedex: Pokedex, pokemon: Pokemon) {
        self.pokemon = pokemon
        
        if let array = pokemon.prev_evolution {
            self.previousEvolution = pokedex.filterPokemon(for: {array.contains($0.id)})
        } else {
            self.previousEvolution =  []
        }
        
        if let array = pokemon.next_evolution {
            self.nextEvolution = pokedex.filterPokemon(for: {array.contains($0.id)})
        } else {
            self.nextEvolution =  []
        }
    }
    
}

//struct PokemonEvolution_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonEvolution()
//    }
//}
