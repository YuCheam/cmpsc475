//
//  NextButton.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/5/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct NextButton: View {
    var body: some View {
        Button("Next") { }
            .padding(.vertical, 10.0)
            .padding(.horizontal, 20)
            .font(.system(size:24, weight: .semibold))
            .background(Color(red: 0.6, green: 0.6, blue: 0.6))
            .foregroundColor(Color.white)
            .cornerRadius(10)
    }
}
