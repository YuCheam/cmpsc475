//
//  DetailInformationView.swift
//  Pokedex
//
//  Created by Kha-Yu Cheam on 9/24/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct PokemonInfo: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack(alignment: .leading) {
            HeadingStyle(heading: "Stats")
            Text("Height: \(pokemon.height, specifier: "%.2f") m")
            Text("Weight: \(pokemon.weight, specifier: "%.2f") kg")
            
            HeadingStyle(heading: "Weaknesses")
            ScrollView(.horizontal){
                HStack{
                    ForEach(pokemon.weaknesses, id:\.self) { weakness in
                        PokemonTypeStyle(label: weakness.id, color: Color(pokemonType: weakness))
                    }
                }
            }
            
            HeadingStyle(heading: "Types")
            ScrollView(.horizontal){
                HStack{
                    ForEach(pokemon.types, id: \.self){ type in
                        PokemonTypeStyle(label: type.id, color: Color(pokemonType: type))
                    }
                }
            }
            
            
        }.frame(minWidth: 0,
                maxWidth: .infinity,
                alignment: .topLeading)
        .font(.system(.body, design: .monospaced))
        .foregroundColor(.white)
        .padding(20)
    }
}

//struct DetailInformationView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailInformationView()
//    }
//}
