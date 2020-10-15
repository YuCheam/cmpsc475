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
    private var disableGetDirections: Bool { startIndex == destinationIndex }
    private var disableClearDirections: Bool {
        startIndex == destinationIndex || locationsManager.route == nil
    }
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Where to")){
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
                        locationsManager.getDirections(fromIndex: startIndex, toIndex: destinationIndex)
                    }.disabled(disableGetDirections)
                    Button("Reset"){
                        locationsManager.route = nil
                        startIndex = -1
                        destinationIndex = -1
                    }.disabled(disableClearDirections)
                }
                
                Section(header: Text("Directions")) {
                    List {
                        ForEach(locationsManager.route?.steps ?? [], id: \.instructions) { step in
                            HStack{
                                Text(step.instructions)
                                Spacer()
                                Text("\(step.distance, specifier: "%.1f")m")
                            }
                        }
                    }
                }
            }
            
        }
    }
    
}

//struct DirectionTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        DirectionTabView()
//    }
//}
