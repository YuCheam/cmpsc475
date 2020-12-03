//
//  HealthView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/12/20.
//

import SwiftUI
import Charts

enum HealthViewState: String, CaseIterable {
    case weight = "Weight"
    case bodyMeasurements = "Body Measurements"
    case pictures = "Pictures"
}

struct HealthView: View {
    @State var viewMode: HealthViewState = .bodyMeasurements
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select Chart", selection: $viewMode){
                    ForEach(HealthViewState.allCases, id: \.self) { mode in
                        Text(mode.rawValue)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                whichView()
                
                Spacer()
            }.navigationBarTitle("Health Stats")
            .navigationBarItems(trailing:
                                    NavigationLink(destination: AddView()){
                                        Label("Add", systemImage: "plus")
                                    }
            )
        }
    }
    
    func whichView() -> some View {
        switch viewMode {
        case .weight:
            return AnyView(Text("weight"))
        case .bodyMeasurements:
            return AnyView(BodyMeasurementView())
        default: // .pictures
            return AnyView(Text("pictures"))
        }
    }
}

struct HealthView_Previews: PreviewProvider {
    static var previews: some View {
        HealthView()
    }
}
