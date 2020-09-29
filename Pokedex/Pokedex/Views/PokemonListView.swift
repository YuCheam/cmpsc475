//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Kha-Yu Cheam on 9/29/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct PokemonListView: View {
    @EnvironmentObject var pokedex: Pokedex
    
    var body: some View {
        List {
            ForEach(pokedex.allPokemon.indices, id: \.self) { index in
                NavigationLink(destination: PokemonDetailView(pokemon: pokedex.allPokemon[index])){
                    HStack {
                        Text(pokedex.allPokemon[index].id.formatString)
                        Text(pokedex.allPokemon[index].name)
                        Spacer()
                        Image(pokedex.allPokemon[index].id.formatString).resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 72)
                    }
                }
            }.listRowBackground(ViewConstants.backgroundColor)
        }.foregroundColor(.white)
        .navigationBarTitle("All Pokemon", displayMode: .inline)
        .font(.system(.body, design: .monospaced))
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
