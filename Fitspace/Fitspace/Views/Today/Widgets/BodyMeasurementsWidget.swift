//
//  BodyMeasurementsWidget.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/12/20.
//

import SwiftUI

struct BodyMeasurementsWidget: View {
    @ObservedObject var healthStats: HealthStats
    var currentBodyMeasurements: BodyMeasurements? {
        if healthStats.bodyMeasurements?.count != 0 {
            return Array(healthStats.bodyMeasurements!).sorted(by: {$0.date > $1.date})[0]
        } else {
            return nil
        }
    }
    
    var lineWidth: CGFloat = 1
    var lineHeight: CGFloat = 52
    
    var body: some View {
        VStack(spacing: 10) {
            if let measurement = currentBodyMeasurements {
                Text("Body Measurements")
                    .font(.system(size: ViewConstants.headingSize, weight: .semibold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 10) {
                    VStack {
                        Text("Neck")
                            .fontWeight(.heavy)
                        Text("\(measurement.neck, specifier: "%.1f") in")
                    }
                    
                    Rectangle()
                        .frame(width: lineWidth, height: lineHeight)
                    
                    VStack {
                        Text("Arm").fontWeight(.heavy)
                        Text("\(measurement.arm, specifier: "%.1f") in")
                            .foregroundColor(Color.offWhite)
                    }
                    
                    Rectangle()
                        .frame(width: lineWidth, height: lineHeight)
                    
                    VStack {
                        Text("Waist").fontWeight(.heavy)
                        Text("\(measurement.waist, specifier: "%.1f") in")
                    }
                    
                    Rectangle()
                        .frame(width: lineWidth, height: lineHeight)
                    
                    VStack {
                        Text("Hips").fontWeight(.heavy)
                        Text("\(measurement.hips, specifier: "%.1f") in")
                    }
                    
                    Rectangle()
                        .frame(width: lineWidth, height: lineHeight)
                    
                    VStack {
                        Text("Thigh").fontWeight(.heavy)
                        Text("\(measurement.thigh, specifier: "%.1f") in")
                    }
                }
                
                Text(measurement.stringDate)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                Text("Body Measurements")
                    .font(.system(size: ViewConstants.headingSize, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("No Body Measurements")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.modifier(CardModifier())
    }
}

//struct BodyMeasurementsWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        BodyMeasurementsWidget()
//    }
//}
