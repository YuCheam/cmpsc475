//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Kha-Yu Cheam on 9/22/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct PokemonDetailView: View {
    @Binding var pokemon : Pokemon
    var idNumber : String { pokemon.id.formatString }
    
    var body: some View {
        ZStack{
            ViewConstants.backgroundColor.edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical){
                VStack {
                    Text("\(pokemon.name)")
                        .font(.system(size: 36, weight: .bold, design: .monospaced))
                        .foregroundColor(ViewConstants.accentColor)
                    
                    ZStack(alignment: .bottomTrailing){
                        Image(idNumber).resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 260)
                        Text("\(idNumber)")
                            .font(.system(.body, design: .monospaced))
                            .foregroundColor(.white)
                            .offset(x: 0, y: 12)
                    }.frame(width: 320, height: 320)
                    .background(ViewConstants.secondaryColor)
                    .cornerRadius(30.0)
                    
                    PokemonInfo(pokemon: pokemon)
                }.padding(.top, 28)
            }
            
        }.navigationBarTitle("", displayMode: .inline)
    }
}


//struct PokemonDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailView(pokemon: Pokedex().getPokemon(index: 11))
//    }
//}
