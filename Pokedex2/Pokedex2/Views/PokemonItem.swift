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
    let imageSize: CGFloat
    var isCapturedColor : Color {pokemon.captured ? ViewConstants.capturedColor : ViewConstants.freeColor}
    var frameWidth : CGFloat {imageSize + 20}
    var frameHeight : CGFloat {imageSize + 60}
    
    var body: some View {
        ZStack{
            
            VStack{
                Image(idNumber).resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageSize)
                Text("\(pokemon.name) \(idNumber)")
            }
            
            Rectangle().foregroundColor(.clear)
                .background(RadialGradient(gradient: Gradient(colors: [.clear, isCapturedColor]), center: .center, startRadius: 0, endRadius: 300))
            
        }.font(.system(size: 14, design: .monospaced))
        .frame(width: frameWidth, height: frameHeight)
        .background(ViewConstants.secondaryColor)
        .cornerRadius(16)
        .foregroundColor(.white)
    }
}

//struct PokemonRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokedexMain()
//    }
//}
