//
//  WeightWidget.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/12/20.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
        
            //.shadow(color: Color.black.opacity(0.6), radius: 20, x: 0, y: 0)
    }
    
}

struct WeightWidget: View {
    @ObservedObject var user: User
    @ObservedObject var healthStats: HealthStats
    
    // Computed Properties
    var startWeight: Float {
        Array(healthStats.weightHistory).sorted(by: {$0.date < $1.date})[0].amount
    }
    
    var goalWeight: Float {
        user.goalWeight
    }
    
    var currentWeight: Float {
        Array(healthStats.weightHistory).sorted(by: {$0.date > $1.date})[0].amount
    }
    
    var amountLeft: Float {
         currentWeight - goalWeight
    }
    
    var fraction: CGFloat {
        CGFloat(1-(amountLeft/(startWeight-goalWeight)))
    }
    
    var body: some View {
        HStack(alignment: .center) {
            ZStack {
                Circle()
                    .stroke(Color.white, lineWidth: 20)
                    .opacity(0.5)
                
                Circle()
                    .trim(from: 0, to: fraction)
                    .stroke(Color.blue, lineWidth: 20)
                    .rotationEffect(.degrees(-90))
                    .overlay(
                        VStack {
                            Text("\(Int(fraction*100))%")
                            Text("\(amountLeft, specifier: "%.1f")lbs left")
                        }
                    )
            }.padding(10)
            .frame(height: 180)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Start Weight: \(startWeight, specifier: "%.1f")")
                Text("Current Weight: \(currentWeight, specifier: "%.1f")")
                Text("Goal Weight: \(goalWeight, specifier: "%.1f")")
            }.font(.system(size: 16, weight: .bold, design: .default))
            
        }
        .padding(10)
        .foregroundColor(.white)
        .background(Color(UIColor(red: 99/255, green: 110/255, blue: 114/255, alpha: 1.0)))
        .modifier(CardModifier())
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

//struct WeightWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        WeightWidget()
//    }
//}

