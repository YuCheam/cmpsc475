//
//  HealthInfoForm.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//

import SwiftUI
import Foundation

struct HealthInfoForm: View {
    @Binding var tabIndex: Int
    @Binding var currentWeight: Double
    @Binding var height: Int
    private var isValidEntries: Bool {
        currentWeight != 0 && height != 0
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Health Information")
                .font(.largeTitle).foregroundColor(Color.white)
                .padding([.top, .bottom], 24)
            
            VStack(alignment: .leading) {
                Slider(value: $currentWeight, in: 0...400, step:0.1, minimumValueLabel: Text("0"), maximumValueLabel: Text("400"), label: {Text("Current Weight: \(currentWeight, specifier: ".1f")")})
                Text("Current Weight: \(currentWeight, specifier: "%.1f") lbs")
            }
            
            Picker("Height", selection: $height) {
                ForEach(0..<84) { i in
                    Text("\(heightFormatter(i))").tag(i)
                }
            }
            
            Button(action: {
                tabIndex += 1
            }) {
              Text("Next")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 50)
                .background(isValidEntries ? Color.green : Color.red)
                .cornerRadius(15.0)
            }.disabled(!isValidEntries)
        }
        .padding(.horizontal)
    }
    
    func heightFormatter(_ height: Int) -> String {
        let inches = height % 12
        let feet = (height-inches)/12
        return "\(feet)'\(inches)''"
    }
}

//struct HealthInfoForm_Previews: PreviewProvider {
//    static var previews: some View {
//        HealthInfoForm()
//    }
//}
