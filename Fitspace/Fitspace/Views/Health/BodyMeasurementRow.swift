//
//  BodyMeasurementView.swift
//  Charts
//
//  Created by Kha-Yu Cheam on 12/2/20.
//

import SwiftUI
import Charts

struct BodyMeasurementRow: View {
    @ObservedObject var healthStats: HealthStats
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        BarChart(healthStats: healthStats)
        
        List {
            ForEach(Array(healthStats.bodyMeasurements ?? []), id: \.self) { measurement in
                VStack(spacing:0) {
                    Text("\(measurement.stringDate)")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                        .background(Color.graphColor)
                        
                    HStack {
                        Button(action: {deleteMeasurement(measurement)}){
                            Label("", systemImage: "trash")
                        }.buttonStyle(PlainButtonStyle())
                        
                        VStack {
                            Text("Neck")
                            Text("\(measurement.neck, specifier: "%.1f")")
                            Text("in")
                        }
                        .padding(5)
                        
                        Rectangle()
                            .frame(width: 2, height: 48)
                        
                        VStack {
                            Text("Arm")
                            Text("\(measurement.arm, specifier: "%.1f")")
                            Text("in")
                        }.padding(5)
                        
                        Rectangle()
                            .frame(width: 2, height: 48)
                        
                        VStack {
                            Text("Waist")
                            Text("\(measurement.waist, specifier: "%.1f")")
                            Text("in")
                        }.padding(5)
                        
                        Rectangle()
                            .frame(width: 2, height: 48)
                        
                        VStack {
                            Text("Hips")
                            Text("\(measurement.hips, specifier: "%.1f")")
                            Text("in")
                        }.padding(5)
                        
                        Rectangle()
                            .frame(width: 2, height: 48)
                        
                        VStack {
                            Text("Thigh")
                            Text("\(measurement.thigh, specifier: "%.1f")")
                            Text("in")
                        }.padding(5)
                    }
                }
            }
        }.listStyle(PlainListStyle())
    }
    
    func deleteMeasurement(_ measurement: BodyMeasurements) {
        viewContext.delete(measurement)
        
        do {
            try viewContext.save()
        } catch {
            print("Could not save view context")
        }
        healthStats.setBodyMeasurementArrays()
    }
    
    init(healthStats: HealthStats) {
        self.healthStats = healthStats
        healthStats.setBodyMeasurementArrays()
    }
}

//struct BodyMeasurementView_Previews: PreviewProvider {
//    static var previews: some View {
//        BodyMeasurementView()
//    }
//}
