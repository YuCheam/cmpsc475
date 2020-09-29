//
//  ContentView.swift
//  Pokedex
//
//  Created by Kha-Yu Cheam on 9/21/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct PokedexMain: View {
    @EnvironmentObject var pokedex : Pokedex
    let gameTitle = "Pokedex"
    
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
                                    destination: PokemonDetailView(pokemon: self.pokedex.allPokemon[index])){
                                    PokemonItem(pokemon: pokedex.allPokemon[index])
                                }
                            }
                        }
                    }
                }
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}


//struct ContentView_Previews: PreviewProvider {
//    @State var pokedex = Pokedex()
//
//    static var previews: some View {
//        PokedexMain(pokedex: $pokedex)
//    }
//}
