//
//  ContentView.swift
//  Pokedex
//
//  Created by Kha-Yu Cheam on 9/21/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct PokedexMain: View {
    @State var pokedex = Pokedex()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.13, green: 0.16, blue: 0.19)
                
                List{
                    ForEach(pokedex.allPokemon.indices) { index in
                        NavigationLink(
                            destination: PokemonDetailView(pokemon: self.pokedex.allPokemon[index])){
                            PokemonRowView(pokemon: pokedex.allPokemon[index])
                        }
                    }.listRowBackground(Color(red: 0.93, green: 0.93, blue: 0.93))
                }
                
            }.edgesIgnoringSafeArea(.all)
            .navigationBarTitle("Pokedex")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexMain()
    }
}
