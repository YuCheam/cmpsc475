//
//  SkillsType.swift
//  Pokedex
//
//  Created by Kha-Yu Cheam on 9/24/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct PokemonTypeStyle: View {
    let label: String
    let color: Color
    
    var body: some View {
        Text("\(label)")
            .minimumScaleFactor(0.5)
            .padding(.init(top: 8, leading: 12, bottom: 8, trailing: 12))
            .background(color)
            .cornerRadius(10)
            .foregroundColor(.black)
    }
}

struct SkillsType_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTypeStyle(label: "derp", color: Color.green)
    }
}
