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
    
    var body: some View {
        NavigationView{
            ZStack{
                ViewConstants.backgroundColor.edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack {
                        Text("\(gameTitle)")
                            .font(.system(size: 36, weight: .bold, design: .monospaced))
                            .foregroundColor(ViewConstants.accentColor)
                        
                        PokemonRow(rowTitle: "All Pokemon", pokemonType: nil)
                        ForEach(PokemonType.allCases) { type in
                            PokemonRow(rowTitle: type.id, pokemonType: type)
                        }
                    }
                }
                
            }.navigationBarTitle("\(gameTitle)", displayMode: .inline)
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
