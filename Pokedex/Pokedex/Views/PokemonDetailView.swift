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
        ZStack{
            Color(red: 0.13, green: 0.16, blue: 0.19)
            
            VStack {
                ZStack(alignment: .bottomTrailing){
                    Image(idNumber).resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 260)
                    Text("\(idNumber)")
                        .font(.system(.body, design: .monospaced))
                        .foregroundColor(.white)
                        .offset(x: 0, y: 12)
                }.frame(width: 320, height: 320)
                .background(Color(red: 0.22, green: 0.24, blue: 0.27))
                .cornerRadius(30.0)
                
                DetailInformationView(pokemon: pokemon)
            }.padding(.top, 28)
            
        }.navigationBarTitle("\(pokemon.name)", displayMode: .inline)
        .edgesIgnoringSafeArea(.all)
    }
    
    init(pokemon : Pokemon) {
        self.pokemon = pokemon
        self.idNumber = String(format: "%03d", pokemon.id)
    }
}


struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokedex().getPokemon(index: 11))
    }
}
