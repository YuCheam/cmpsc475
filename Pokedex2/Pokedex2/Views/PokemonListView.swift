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
    var pokemonList : [Pokemon] {
        pokemonType != nil ? pokedex.filterPokemon(for: {$0.types.contains(pokemonType!)}) : pokedex.allPokemon
    }
    var title : String {
        if pokemonType != nil {
            return pokemonType!.id
        } else {
            return "All Pokemon"
        }
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(pokemonList, id: \.self) { pokemon in
                    NavigationLink(destination: PokemonDetailView(pokemon: pokemon)){
                        HStack {
                            Text(pokemon.id.formatString)
                            Text(pokemon.name)
                            Spacer()
                            Image(pokemon.id.formatString).resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 72)
                        }
                    }
                }.listRowBackground(ViewConstants.backgroundColor)
                .foregroundColor(.white)
            }.navigationBarTitle("\(title)", displayMode: .inline)
            .navigationBarItems(trailing:
                Picker(selection: $pokemonType, label: Text("Filter")){
                    Text("No Filter").tag(nil as PokemonType?)
                    ForEach(PokemonType.allCases) { type in
                        Text(type.id).tag(type as PokemonType?)
                    }
                }.pickerStyle(MenuPickerStyle())
            )
            .font(.system(.body, design: .monospaced))

        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
