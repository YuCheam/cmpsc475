//
//  DirectionSheet.swift
//  Campus
//
//  Created by Kha-Yu Cheam on 10/12/20.
//

import SwiftUI

struct DirectionSheet: View {
    @EnvironmentObject var locationsManager: LocationsManager
    @State var startIndex: Int = -1
    @State var destinationIndex: Int = -1
    @Binding var isShowingSheet: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: self.$startIndex, label: Text("From")){
                        Text("Current Location").tag(-1)
                        ForEach(locationsManager.allBuildings.indices, id: \.self){ index in
                            Text("\(locationsManager.allBuildings[index].name)").tag(index)
                        }
                    }.id(UUID())
                    
                    Picker(selection: self.$destinationIndex, label: Text("To")){
                        Text("Current Location").tag(-1)
                        ForEach(locationsManager.allBuildings.indices, id: \.self){ index in
                            Text("\(locationsManager.allBuildings[index].name)").tag(index)
                        }
                    }.id(UUID())
                }
                
                Section {
                    Button("Get Directions", action: {
                        let source = self.startIndex == -1 ? nil as Building? : locationsManager.allBuildings[startIndex]
                        let destination = self.destinationIndex == -1 ? nil as Building? :
                            locationsManager.allBuildings[destinationIndex]
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
