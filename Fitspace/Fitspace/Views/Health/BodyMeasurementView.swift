//
//  BodyMeasurementView.swift
//  Charts
//
//  Created by Kha-Yu Cheam on 12/2/20.
//

import SwiftUI

struct BodyMeasurementView: View {
    var body: some View {
        Text("Hello")
        List {
            VStack(spacing:0) {
                Text("\(Date().formattedDate)")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                    .background(Color.graphColor)
                HStack {
                    VStack {
                        Text("Neck")
                        Text("23")
                        Text("inches")
                    }
                    .padding(5)
                    
                    Rectangle()
                        .frame(width: 2, height: 48)
                        
                        
                    
                    VStack {
                        Text("Neck")
                        Text("23")
                        Text("inches")
                    }.padding(5)
                }
            }
        }.padding(0)
    }
}

struct BodyMeasurementView_Previews: PreviewProvider {
    static var previews: some View {
        BodyMeasurementView()
    }
}
