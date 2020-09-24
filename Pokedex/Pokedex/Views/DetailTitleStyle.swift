//
//  DetailTitleStyle.swift
//  Pokedex
//
//  Created by Kha-Yu Cheam on 9/24/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct DetailTitleStyle: View {
    let title: String
    var body: some View {
        Text(title).font(.system(size: 20, weight: .bold, design: .monospaced))
            .foregroundColor(Color(red: 0.71, green: 0.33, blue: 0.00))
            .padding(.top, 16)
    }
}

struct DetailTitleStyle_Previews: PreviewProvider {
    static var previews: some View {
        DetailTitleStyle(title: "Hello")
    }
}
