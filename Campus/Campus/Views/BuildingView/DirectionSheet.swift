//
//  DirectionSheet.swift
//  Campus
//
//  Created by Kha-Yu Cheam on 10/12/20.
//

import SwiftUI

struct DirectionSheet: View {
    @EnvironmentObject var locationsManager: LocationsManager
    @State var startIndex: Int?
    @State var destinationIndex: Int?
    @Binding var isShowingSheet: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $startIndex, label: Text("From")){
                        Text("Current Location").tag(nil as Int?)
                        ForEach(locationsManager.allBuildings.indices){ index in
                            Text("\(locationsManager.allBuildings[index].name)").tag(index as Int?)
                        }
                    }
                    
                    Picker(selection: $destinationIndex, label: Text("To")){
                        Text("Current Location").tag(nil as Int?)
                        ForEach(locationsManager.allBuildings.indices){ index in
                            Text("\(locationsManager.allBuildings[index].name)").tag(index as Int?)
                        }
                    }
                }
                
                Section {
                    Button("Get Directions", action: {
                        let source = startIndex == nil ? nil as Building? : locationsManager.allBuildings[startIndex!]
                        let destination = destinationIndex == nil ? nil as Building? : locationsManager.allBuildings[destinationIndex!]
                        
                        let route = getDirections(from: source, to: destination)
                    })
                    Button("Dismiss", action: {isShowingSheet.toggle()})
                }
            }.navigationBarTitle("Directions")
        }
    }
    
    func getDirections(from: Building?, to: Building?) {
        
    }
}

//struct DirectionSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        DirectionSheet()
//    }
//}
