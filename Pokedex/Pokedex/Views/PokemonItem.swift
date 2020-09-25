//
//  PokemonRowView.swift
//  Pokedex
//
//  Created by Kha-Yu Cheam on 9/22/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct PokemonItem: View {
    var pokemon : Pokemon
    var idNumber: String
    
    var body: some View {
        VStack{
            Image(idNumber).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            Text("\(pokemon.name) \(idNumber)")
        }.font(.system(.body, design: .monospaced))
        .padding(10)
        .background(Color(red: 0.22, green: 0.24, blue: 0.27))
        .cornerRadius(30.0)
        .foregroundColor(.white)
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
