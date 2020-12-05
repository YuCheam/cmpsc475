//
//  WeightForm.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/5/20.
//

import SwiftUI

struct WeightForm: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var healthStats: HealthStats
    
    @State var currentWeight: Float = 0.0
    @State var date: Date = Date()
    
    var body: some View {
        Form {
            Section(header: Text("Date")) {
                DatePicker("Date", selection: $date, in: ...Date(),  displayedComponents: .date)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
            }
            
            Section {
                Slider(value: $currentWeight, in: 0...400, step:0.1, minimumValueLabel: Text("0"), maximumValueLabel: Text("400"), label: {Text("Current Weight: \(currentWeight, specifier: ".1f")")})
                Text("Current Weight: \(currentWeight, specifier: "%.1f") lbs")
            }
            
            Section {
                HStack {
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}){
                        Text("Cancel")
                            .modifier(ButtonStyle(ViewConstants.errorButtonColor))
                    }.buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    Button(action: {addWeight()}){
                        Text("Add")
                            .modifier(ButtonStyle(ViewConstants.defaultButtonColor))
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }.navigationBarTitle("Add Weight")
        .navigationBarBackButtonHidden(true)
    }
    
    func addWeight() {
        let newWeight = Weight(context: viewContext)
        newWeight.amount = currentWeight
        newWeight.date = date
        
        healthStats.addToWeightHistory(newWeight)
        
        do {
            try viewContext.save()
        } catch {
            print("Body Measurements could not be created")
        }
        self.presentationMode.wrappedValue.dismiss()
    }
}

//struct WeightForm_Previews: PreviewProvider {
//    static var previews: some View {
//        WeightForm()
//    }
//}
