//
//  HealthInfoForm.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//

import SwiftUI
import Foundation

struct HealthInfoForm: View {
    @Binding var pushHealthInfo: Bool
    @Binding var pushEndView: Bool
    @Binding var currentWeight: Float
    @Binding var goalWeight: Float
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
                Text("Current Weight: \(currentWeight, specifier: "%.1f") lbs")
                Slider(value: $currentWeight, in: 0...400, step:0.1, minimumValueLabel: Text("0"), maximumValueLabel: Text("400"), label: {Text("Current Weight: \(currentWeight, specifier: ".1f")")})
            }
            .modifier(FieldModifier())
            
            VStack(alignment: .leading) {
                Text("Goal Weight: \(goalWeight, specifier: "%.1f") lbs")
                Slider(value: $goalWeight, in: 0...400, step:0.1, minimumValueLabel: Text("0"), maximumValueLabel: Text("400"), label: {Text("Goal Weight: \(goalWeight, specifier: ".1f")")})
            }.modifier(FieldModifier())
            
            HStack {
                Text("Height: \(heightFormatter(height))")
                Spacer()
                Picker("+ Add", selection: $height) {
                    ForEach(0..<80) { i in
                        Text("\(heightFormatter(i))").tag(i)
                    }
                }.padding(8)
                .background(ViewConstants.errorButtonColor)
                .foregroundColor(.white)
                .cornerRadius(4)
                .pickerStyle(MenuPickerStyle())
            }.frame(maxWidth: .infinity)
            .modifier(FieldModifier())
            
            
            Button(action: {
                pushHealthInfo = false
                pushEndView = true
            }) {
              Text("Next")
                .modifier(ButtonStyle(isValidEntries ? ViewConstants.defaultButtonColor : ViewConstants.errorButtonColor))
            }.disabled(!isValidEntries)
        }
        .padding(.horizontal)
        .modifier(OnboardingModifier())
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
