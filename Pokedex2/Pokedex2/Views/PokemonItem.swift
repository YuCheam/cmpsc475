//
//  PokemonRowView.swift
//  Pokedex
//
//  Created by Kha-Yu Cheam on 9/22/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct PokemonItem: View {
    let pokemon : Pokemon
    let idNumber : String
    let pokemonImageSize: CGFloat
    
    var body: some View {
        VStack{
            Image(idNumber).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: pokemonImageSize, height: pokemonImageSize)
            Text("\(pokemon.name) \(idNumber)")
        }.font(.system(.body, design: .monospaced))
        .padding(10)
        .background(ViewConstants.secondaryColor)
        .cornerRadius(30.0)
        .foregroundColor(.white)
    }
    
    init(pokemon: Pokemon, size: CGFloat) {
        self.pokemon = pokemon
        self.idNumber = pokemon.id.formatString
        self.pokemonImageSize = size
    }
}

//struct PokemonRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokedexMain()
//    }
//}
