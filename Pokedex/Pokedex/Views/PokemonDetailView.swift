//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Kha-Yu Cheam on 9/22/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct PokemonDetailView: View {
    var pokemon : Pokemon
    var idNumber : String
    
    
    var body: some View {
        List {
            Text("\(pokemon.name)")
            Image(idNumber).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            Section(header: Text("Stats")) {
                Text("Height: \(pokemon.height)")
                Text("Weight: \(pokemon.weight)")
            }
            
            Section(header: Text("Weaknesses")){
                ForEach(pokemon.weaknesses, id:\.self) { weakness in
                    Text("\(weakness.id)").foregroundColor(Color(pokemonType: weakness))
                }
            }
            
            Section(header: Text("Types")){
                ForEach(pokemon.types, id: \.self){ type in
                    Text("\(type.id)").foregroundColor(Color(pokemonType: type))
                }
            }

        }
        
    }
    
    init(pokemon : Pokemon) {
        self.pokemon = pokemon
        self.idNumber = String(format: "%03d", pokemon.id)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexMain()
    }
}
