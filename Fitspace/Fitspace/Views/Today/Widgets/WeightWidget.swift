//
//  WeightWidget.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/12/20.
//

import SwiftUI

struct WeightWidget: View {
    @ObservedObject var user: User
    @ObservedObject var healthStats: HealthStats
    
    // Computed Properties
    var startWeight: Float {
        healthStats.weightHistory.count == 0 ? 0 : Array(healthStats.weightHistory).sorted(by: {$0.date < $1.date})[0].amount
    }
    
    var goalWeight: Float {
        user.goalWeight
    }
    
    var currentWeight: Float {
        healthStats.weightHistory.count == 0 ? 0 : Array(healthStats.weightHistory).sorted(by: {$0.date > $1.date})[0].amount
    }
    
    var amountLeft: Float {
        if currentWeight >= goalWeight {
            return currentWeight - goalWeight
        } else {
            return goalWeight - currentWeight
        }
    }
    
    var fraction: CGFloat {
        if startWeight >= goalWeight {
            return CGFloat(1-(amountLeft/(startWeight-goalWeight)))
        } else {
            return CGFloat(1-(amountLeft/(goalWeight-startWeight)))
        }
        
    }
    
    var body: some View {
        HStack(alignment: .top) {
            ZStack {
                Circle()
                    .stroke(Color.white, lineWidth: 20)
                    .opacity(0.5)
                
                Circle()
                    .trim(from: 0, to: fraction)
                    .stroke(Color.accent, lineWidth: 20)
                    .rotationEffect(.degrees(-90))
                    .overlay(
                        VStack {
                            Text("\(Int(fraction*100))%")
                            Text("\(amountLeft, specifier: "%.1f")lbs left")
                        }
                    )
            }.padding(10)
            .frame(height: 180)
            
            VStack(alignment: .trailing, spacing: 5) {
                Text("Weight")
                    .font(.system(size: ViewConstants.headingSize, weight: .semibold, design: .default))
                    .padding(.vertical, 6)
                Text("Start Weight: \(startWeight, specifier: "%.1f")")
                Text("Current Weight: \(currentWeight, specifier: "%.1f")")
                Text("Goal Weight: \(goalWeight, specifier: "%.1f")")
            }
            
        }.modifier(CardModifier())
    }
}

//struct WeightWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        WeightWidget()
//    }
//}

