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
    
    var body: some View {
        VStack(spacing: 10) {
            if let measurement = currentBodyMeasurements {
                Text("Body Measurements")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 10) {
                    VStack {
                        Text("Neck")
                        Text("\(measurement.neck, specifier: "%.1f") in")
                    }
                    
                    VStack {
                        Text("Arm")
                        Text("\(measurement.arm, specifier: "%.1f") in")
                    }
                    
                    VStack {
                        Text("Waist")
                        Text("\(measurement.waist, specifier: "%.1f") in")
                    }
                    
                    VStack {
                        Text("Hips")
                        Text("\(measurement.hips, specifier: "%.1f") in")
                    }
                    
                    VStack {
                        Text("Thigh")
                        Text("\(measurement.thigh, specifier: "%.1f") in")
                    }
                }
            } else {
                Text("Add Body Measurements")
            }
        }.modifier(CardModifier())
    }
}

//struct BodyMeasurementsWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        BodyMeasurementsWidget()
//    }
//}
