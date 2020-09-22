//
//  PokemonRowView.swift
//  Pokedex
//
//  Created by Kha-Yu Cheam on 9/22/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct PokemonRowView: View {
    var pokemon : Pokemon
    var idNumber: String
    
    var body: some View {
        HStack{
            Text("\(pokemon.name)")
            Text(idNumber)
            Spacer()
            Image(idNumber).resizable()
                .frame(width:100)
        }
    }
    
    init(pokemon : Pokemon) {
        self.pokemon = pokemon
        self.idNumber = String(format: "%03d", pokemon.id)
    }
}

struct PokemonRowView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexMain()
    }
}
