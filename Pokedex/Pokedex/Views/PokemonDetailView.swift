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
    var body: some View {
        Text("\(pokemon.name)")
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexMain()
    }
}
