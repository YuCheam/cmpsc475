//
//  Multiplication.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/5/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct Multiplication: View {
    let numberOne: Int
    let numberTwo: Int
    let symbol: String
    let multiplicationWidth: CGFloat = 120
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("Problem 4").font(.headline)
            
            Text("\(self.numberOne)")
            
            HStack {
                Text(symbol)
                Text("\(self.numberTwo)")
            }
            
            Rectangle().frame(width: multiplicationWidth, height: 5)
        }.font(.system(size: 55))
    }
    
    init(numberOne: Int, numberTwo: Int) {
        self.numberOne = numberOne
        self.numberTwo = numberTwo
        self.symbol = "x"
    }
}
