//
//  BuildingInfoComponent.swift
//  Campus
//
//  Created by Kha-Yu Cheam on 10/8/20.
//

import SwiftUI

struct BuildingInfoComponent: View {
    @EnvironmentObject var locationsManager : LocationsManager
    @Binding var building: Building
    @Binding var tab: Int
    
    var body: some View {
        VStack {
            Text("Building Code: \(String(format: "%06d", building.buildingCode))")
            Text("Year Constructed: \(getYear(for: building))" )
            Text("Latitude: \(building.latitude)")
            Text("Longitude: \(building.longitude)")
        }
    }
    
    func getYear(for building: Building) -> String {
        if building.yearConstructed != nil {
            return building.yearConstructed!.toYear
        } else {
            return "unknown"
        }
    }

}

//struct BuildingInfoComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        BuildingInfoComponent()
//    }
//}
