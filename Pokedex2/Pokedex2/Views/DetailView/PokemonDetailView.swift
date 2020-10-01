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
    var buttonText : String {pokemon.captured ? "Free" : "Capture"}
    var isCapturedColor : Color {pokemon.captured ? ViewConstants.capturedColor : ViewConstants.freeColor}
    
    var body: some View {
        ZStack{
            ViewConstants.backgroundColor.edgesIgnoringSafeArea(.all)
            ScrollView(.vertical){
                VStack {
                    Text("\(pokemon.name)")
                        .font(.system(size: 36, weight: .bold, design: .monospaced))
                        .foregroundColor(ViewConstants.accentColor)
                    
                    ZStack(){
                        Image(idNumber).resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 260)
                        Text("\(idNumber)")
                            .font(.system(.body, design: .monospaced))
                            .foregroundColor(.white)
                            .frame(width: 300, height: 300, alignment: .bottomTrailing)
                        Rectangle().foregroundColor(.clear)
                            .background(RadialGradient(gradient: Gradient(colors: [.clear, isCapturedColor]), center: .center, startRadius: 100, endRadius: 400))
                    }.frame(width: 320, height: 320)
                    .background(ViewConstants.secondaryColor)
                    .cornerRadius(30.0)
                    
                    PokemonInfo(pokemon: pokemon)
                }.padding(.top, 28)
            }
            
        }.navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {pokemon.captured.toggle()}){
            Text(buttonText)
        })
    }
}


//struct PokemonDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailView(pokemon: Pokedex().getPokemon(index: 11))
//    }
//}
