//
//  BarView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/1/20.
//

import SwiftUI

struct BarView: View {
    var value: CGFloat
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color.primary)
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(Color.primaryLight)
            }
            Text("10/12").padding(.top, 8)
        }
    }
}

//struct BarView_Previews: PreviewProvider {
//    static var previews: some View {
//        BarView()
//    }
//}
