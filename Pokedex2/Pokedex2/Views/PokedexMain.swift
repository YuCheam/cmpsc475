//
//  ContentView.swift
//  Pokedex2
//
//  Created by Kha-Yu Cheam on 9/29/20.
//

import SwiftUI

struct PokedexMain: View {
    @EnvironmentObject var pokedex : Pokedex
    let gameTitle = "Pokedex"
    let pokemonImageSize : CGFloat = 200
    
    var body: some View {
        NavigationView{
            ZStack{
                ViewConstants.backgroundColor.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("\(gameTitle)")
                        .font(.system(size: 36, weight: .bold, design: .monospaced))
                        .foregroundColor(ViewConstants.accentColor)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 30) {
                            ForEach(pokedex.allPokemon.indices) { index in
                                NavigationLink(
                                    destination: PokemonDetailView(pokemon: self.$pokedex.allPokemon[index])){
                                    PokemonItem(pokemon: pokedex.allPokemon[index], size: pokemonImageSize)
                                }
                            }
                        }
                    }
                }
            }.navigationBarTitle("")
            .navigationBarItems(trailing: NavigationLink(destination: PokemonListView()){
                Text("List")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexMain()
    }
}
