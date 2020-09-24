//
//  DetailInformationView.swift
//  Pokedex
//
//  Created by Kha-Yu Cheam on 9/24/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct DetailInformationView: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack(alignment: .leading) {
            DetailTitleStyle(title: "Stats")
            Text("Height: \(pokemon.height, specifier: "%.2f") m")
            Text("Weight: \(pokemon.weight, specifier: "%.2f") kg")
            
            DetailTitleStyle(title: "Weaknesses")
            ScrollView(.horizontal){
                HStack{
                    ForEach(pokemon.weaknesses, id:\.self) { weakness in
                        TypeStyle(label: weakness.id, color: Color(pokemonType: weakness))
                    }
                }
            }
            
            DetailTitleStyle(title: "Types")
            ScrollView(.horizontal){
                HStack{
                    ForEach(pokemon.types, id: \.self){ type in
                        TypeStyle(label: type.id, color: Color(pokemonType: type))
                    }
                }
            }
        }.frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading)
        .font(.system(.body, design: .monospaced))
        .foregroundColor(.white)
        .padding()
    }
}

//struct DetailInformationView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailInformationView()
//    }
//}
