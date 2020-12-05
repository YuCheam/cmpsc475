//
//  WeightView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/5/20.
//

import SwiftUI

struct WeightView: View {
    @ObservedObject var healthStats: HealthStats
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        LineGraph()
        
        List {
            ForEach(Array(healthStats.weightHistory), id: \.self) { weight in
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
    }
}

//struct WeightView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeightView()
//    }
//}
