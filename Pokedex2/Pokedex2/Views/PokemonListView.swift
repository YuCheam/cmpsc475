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
    var pokemonList : [Int] {
        pokemonType != nil ? pokedex.filterPokemon(for: {$0.types.contains(pokemonType!)}) : pokedex.allPokemon.map({$0.id-1})
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
                ForEach(pokemonList, id: \.self) { index in
                    NavigationLink(destination: PokemonDetailView(pokemon: self.$pokedex.allPokemon[index])){
                        HStack {
                            Text(pokedex.allPokemon[index].id.formatString)
                            Text(pokedex.allPokemon[index].name)
                            isCapturedColor(pokedex.allPokemon[index])
                            Spacer()
                            Image(pokedex.allPokemon[index].id.formatString).resizable()
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
    
    func isCapturedColor(_ pokemon: Pokemon) -> Text {
        pokemon.captured ? Text("✓").foregroundColor(ViewConstants.capturedColor) : Text("𝖷").foregroundColor(ViewConstants.freeColor)
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
