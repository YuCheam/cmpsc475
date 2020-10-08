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
        GeometryReader{ geo in
            VStack(alignment: .leading) {
                Text("Building Code: \(String(format: "%06d", building.buildingCode))")
                Text("Year Constructed: \(getYear(for: building))" )
                Text("Coordinate Location: \(building.latitude), \(building.longitude)")
                
                Spacer()
                
                Toggle(isOn: $building.favorited) {
                    Text("Favorite "+isFavorited(for: building.favorited))
                }
            }.padding()
            .background(ViewConstants.secondaryColor)
            .cornerRadius(10)
            .frame(width: geo.size.width)
        }
    }
    
    func getYear(for building: Building) -> String {
        if building.yearConstructed != nil {
            return building.yearConstructed!.toYear
        } else {
            return "unknown"
        }
    }
    
    func isFavorited(for favorited: Bool) -> String {
        return favorited ? "★" : "☆"
    }

}

//struct BuildingInfoComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        BuildingInfoComponent()
//    }
//}
