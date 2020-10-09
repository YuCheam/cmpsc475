//
//  BuildingView.swift
//  Campus
//
//  Created by Kha-Yu Cheam on 10/7/20.
//

import SwiftUI

struct BuildingView: View {
    @EnvironmentObject var locationsManager : LocationsManager
    @Environment(\.presentationMode) var presentation
    @Binding var building : Building
    @Binding var tab: Int
    var heading: String {
        building.favorited ? "\(building.name) ★" : building.name
    }
    
    var body: some View {
        ZStack {
            ViewConstants.backgroundColor
            
            VStack{
                if (building.photo != nil) {
                    Image(building.photo!).resizable()
                        .frame(height: 240)
                }
                
                VStack() {
                    Text(heading).font(.system(size: 24, weight: .bold))
                    
                    BuildingInfoComponent(building: $building, tab: $tab)
                    
                    Spacer()
                    
                    Button(action: {building.favorited.toggle()}){
                        HStack{
                            Text("Favorite")
                            Image(systemName: "star")
                        }.padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                    }
                }.padding()
            }
            
        }.navigationBarItems(trailing:
                                Button(action: {plotBuilding(for: building)}){
                                    HStack {
                                        Text("Plot")
                                        Image(systemName: "mappin")
                                    }
                                }
        )
        
    }
    
    func plotBuilding(for building: Building) {
        locationsManager.plottedBuildings.append(building)
        
        // Change to Map View
        tab = 0
        self.presentation.wrappedValue.dismiss()
        
        // Center View
        locationsManager.centerToPlot(for: building)
    }
    
}

//struct BuildingView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        BuildingView(building: locationsManager.$allBuildings[2], tab: 0)
//    }
//}
