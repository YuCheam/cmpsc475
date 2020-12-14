//
//  WeightView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/5/20.
//

import SwiftUI
import Charts

struct WeightView: View {
    @ObservedObject var healthStats: HealthStats
    @Environment(\.managedObjectContext) private var viewContext
    var entries: [ChartDataEntry]
    var xAxisFormatter: ChartXAxisFormatter
    
    var body: some View {
        LineGraph(entries: entries, xAxisFormatter: xAxisFormatter)
        
        List {
            ForEach(Array(healthStats.weightHistory).sorted(by: {$0.date > $1.date}), id: \.self) { weight in
                HStack{
                    Text("\(weight.stringDate)")
                    Text("Weight: \(weight.amount, specifier: "%.1f") lbs")
                    
                    Spacer()
                    
                    Button(action: {deleteWeight(weight)}) {
                        Label("", systemImage: "trash")
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
    
    func deleteWeight(_ weight: Weight) {
        viewContext.delete(weight)
        
        do {
            try viewContext.save()
        } catch {
            print("Cannot delete weight")
        }
        
        healthStats.updateWeightChartData()
    }
    
    init(healthStats: HealthStats){
        self.healthStats = healthStats
        healthStats.updateWeightChartData()
        self.entries = healthStats.weightEntries
        self.xAxisFormatter = healthStats.xAxisFormatter
    }
}

//struct WeightView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeightView()
//    }
//}
