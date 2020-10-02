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
    var isEmpty: Bool {pokedex.allPokemon.filter({$0.captured == true}).count == 0 ? true : false }
    
    var body: some View {
        NavigationView{
            ZStack{
                ViewConstants.backgroundColor.edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack(spacing: 8) {
                        if !isEmpty {
                            PokemonRow(rowTitle: "Captured Pokemon", property: {$0.captured == true})
                        }
                        
                        ForEach(PokemonType.allCases) { type in
                            PokemonRow(rowTitle: type.id, property: {$0.types.contains(type)})
                        }
                    }
                }
                
            }.navigationBarTitle("\(gameTitle)", displayMode: .inline)
            .navigationBarItems(trailing: NavigationLink(destination: PokemonListView()){
                Text("List →").bold()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexMain()
    }
}
