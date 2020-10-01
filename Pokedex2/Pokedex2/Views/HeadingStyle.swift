//
//  DetailTitleStyle.swift
//  Pokedex
//
//  Created by Kha-Yu Cheam on 9/24/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct HeadingStyle: View {
    let heading: String
    var body: some View {
        Text(heading).font(.system(size: 20, weight: .bold, design: .monospaced))
            .foregroundColor(ViewConstants.accentColor)
            .padding(.top, 16)
    }
}

struct DetailTitleStyle_Previews: PreviewProvider {
    static var previews: some View {
        HeadingStyle(heading: "Hello")
    }
}
