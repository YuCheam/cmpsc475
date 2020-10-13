//
//  DirectionTabView.swift
//  Campus
//
//  Created by Kha-Yu Cheam on 10/13/20.
//

//Picker(selection: $startIndex, label: Text("From")){
//    Text("Current Location").tag(-1)
//    ForEach(locationsManager.allBuildings.indices, id: \.self){ index in
//        Text("\(locationsManager.allBuildings[index].name)").tag(index)
//    }
//}
//
//Picker(selection: $destinationIndex, label: Text("To")){
//    Text("Current Location").tag(-1)
//    ForEach(locationsManager.allBuildings.indices, id: \.self){ index in
//        Text("\(locationsManager.allBuildings[index].name)").tag(index)
//    }
//}

import SwiftUI
import MapKit

struct DirectionTabView: View {
    @Binding var tab: Int
    @EnvironmentObject var locationsManager: LocationsManager
    @State private var startIndex: Int = -1
    @State private var destinationIndex: Int = -1
    
    var body: some View {
        VStack {
            Form {
                Picker("From", selection: $startIndex){
                    Text("Current Location").tag(-1)
                    ForEach(0 ..< locationsManager.allBuildings.count) { index in
                        Text(locationsManager.allBuildings[index].name).tag(index)
                    }
                }
                
                Picker("To", selection: $destinationIndex){
                    Text("Current Location").tag(-1)
                    ForEach(0 ..< locationsManager.allBuildings.count) {
                        Text(locationsManager.allBuildings[$0].name).tag($0)
                    }
                }
                Button("Get Directions"){
                    getDirections()
                }
            }
            
            VStack {
                Text("Directions")
                ForEach(locationsManager.route?.steps ?? [], id: \.instructions) { step in
                    Text(step.instructions)
                }
            }
        }
    }
    
    func getDirections() {
        locationsManager.getDirections(fromIndex: startIndex, toIndex: destinationIndex)
    }
}

//struct DirectionTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        DirectionTabView()
//    }
//}
