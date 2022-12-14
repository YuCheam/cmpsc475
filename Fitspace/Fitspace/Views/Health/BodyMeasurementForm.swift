//
//  AddView.swift
//  Charts
//
//  Created by Kha-Yu Cheam on 12/2/20.
//

import SwiftUI

struct BodyMeasurementForm: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var healthStats: HealthStats
    
    @State var neckMeasurement: Double = 0.0
    @State var armMeasurement: Double = 0.0
    @State var hipMeasurement: Double = 0.0
    @State var thighMeasurement: Double = 0.0
    @State var waistMeasurement: Double = 0.0
    @State var date = Date()
    
    var body: some View {
        Form {
            Section(header: Text("Date")) {
                DatePicker("Date", selection: $date, in: ...Date(),  displayedComponents: .date)
            }
            
            Section(header: Text("Body Measurements")) {
                VStack {
                    Text("Neck Measurement: \(neckMeasurement, specifier: "%.1f") in")
                    Slider(value: $neckMeasurement, in: 0...100, step:0.1, minimumValueLabel: Text("0"), maximumValueLabel: Text("100"), label: {})
                    
                    Text("Arm Measurement: \(armMeasurement, specifier: "%.1f") in")
                    Slider(value: $armMeasurement, in: 0...100, step:0.1, minimumValueLabel: Text("0"), maximumValueLabel: Text("100"), label: {})
                    
                    Text("Hip Measurement: \(hipMeasurement, specifier: "%.1f") in")
                    Slider(value: $hipMeasurement, in: 0...100, step:0.1, minimumValueLabel: Text("0"), maximumValueLabel: Text("100"), label: {})
                    
                    Text("Thigh Measurement: \(thighMeasurement, specifier: "%.1f") in")
                    Slider(value: $thighMeasurement, in: 0...100, step:0.1, minimumValueLabel: Text("0"), maximumValueLabel: Text("100"), label: {})
                    
                    Text("Waist Measurement: \(waistMeasurement, specifier: "%.1f") in")
                    Slider(value: $waistMeasurement, in: 0...100, step:0.1, minimumValueLabel: Text("0"), maximumValueLabel: Text("100"), label: {})
                }
            }
            
            Section {
                HStack {
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}){
                        Text("Cancel")
                            .modifier(ButtonStyle(ViewConstants.errorButtonColor))
                    }.buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    Button(action: {addBodyMeasurements()}){
                        Text("Add")
                            .modifier(ButtonStyle(ViewConstants.defaultButtonColor))
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }.navigationBarTitle("Add Body Measurements")
        .navigationBarBackButtonHidden(true)
    }
    
    func addBodyMeasurements() {
        let newEntry = BodyMeasurements(context: viewContext)
        newEntry.arm = armMeasurement
        newEntry.hips = hipMeasurement
        newEntry.neck = neckMeasurement
        newEntry.thigh = thighMeasurement
        newEntry.waist = waistMeasurement
        newEntry.date = date
        
        healthStats.addToBodyMeasurements(newEntry)

        do {
            try viewContext.save()
        } catch {
            print("Body Measurements could not be created")
        }
        self.presentationMode.wrappedValue.dismiss()
        healthStats.setBodyMeasurementArrays()
    }
}

//struct AddView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddView()
//    }
//}
