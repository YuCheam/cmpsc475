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
    let gameTitle = "Pokedex"
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.13, green: 0.16, blue: 0.19).edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("\(gameTitle)")
                        .font(.system(size: 36, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                    ScrollView(.horizontal) {
                        HStack(spacing: 30) {
                            ForEach(pokedex.allPokemon.indices) { index in
                                NavigationLink(
                                    destination: PokemonDetailView(pokemon: self.pokedex.allPokemon[index])){
                                    PokemonRowView(pokemon: pokedex.allPokemon[index])
                                }
                            }
                        }
                    }.frame(height: 400)
                }
                
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexMain()
    }
}
