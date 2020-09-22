//
//  ContentView.swift
//  Pokedex
//
//  Created by Kha-Yu Cheam on 9/21/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct PokedexMain: View {
    @State var pokedex = Pokedex()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(pokedex.allPokemon.indices) { index in
                    Text("\(pokedex.allPokemon[index].name)")
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexMain()
    }
}
