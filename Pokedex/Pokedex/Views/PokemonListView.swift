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
    @State var pokemonType: PokemonType?
    @State var showFilterList: Bool = false
    
    var body: some View {
        VStack {
            Form {
                Picker(selection: $pokemonType, label: Text("Type")){
                    Text("No Filter").tag(nil as PokemonType?)
                    ForEach(PokemonType.allCases) { type in
                        Text(type.id).tag(type as PokemonType?)
                    }
                }
            }
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
            }.navigationBarTitle("All Pokemon", displayMode: .inline)
            .foregroundColor(.white)
            .font(.system(.body, design: .monospaced))

        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
