//
//  AddView.swift
//  Charts
//
//  Created by Kha-Yu Cheam on 12/2/20.
//

import SwiftUI

struct AddView: View {
    @State var showBodyMeasurements: Bool = true
    
    var body: some View {
        Form {
            Section(header: Text("Date")) {
                Text("Date: \(Date().formattedDate)")
            }
            
            Section(header: Text("Body Measurements")) {
                Toggle(isOn: $showBodyMeasurements) {
                    Text("Add Body Measurements")
                }
                
                if showBodyMeasurements {
                    
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
