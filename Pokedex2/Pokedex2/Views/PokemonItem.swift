//
//  PokemonRowView.swift
//  Pokedex
//
//  Created by Kha-Yu Cheam on 9/22/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct PokemonItem: View {
    @Binding var pokemon : Pokemon
    var idNumber : String {pokemon.id.formatString}
    let size: CGFloat
    var isCapturedColor : Color {pokemon.captured ? ViewConstants.capturedColor : ViewConstants.freeColor}
    var frameSize : CGFloat {size + 40}
    
    var body: some View {
        ZStack(alignment: .top){
            VStack{
                Image(idNumber).resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
                Text("\(pokemon.name) \(idNumber)")
            }
            Rectangle().foregroundColor(.clear)
                .background(RadialGradient(gradient: Gradient(colors: [.clear, isCapturedColor]), center: .center, startRadius: 0, endRadius: 300))
        }.font(.system(.body, design: .monospaced))
        .frame(width: frameSize, height: frameSize)
        .background(ViewConstants.secondaryColor)
        .cornerRadius(30.0)
        .foregroundColor(.white)
    }
}

//struct PokemonRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokedexMain()
//    }
//}
