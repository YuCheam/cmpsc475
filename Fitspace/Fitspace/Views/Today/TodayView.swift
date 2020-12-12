//
//  TodayView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/12/20.
//

import SwiftUI

struct TodayView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var user: User
    @State private var editMode = EditMode.inactive

    @State private var refreshing = false
    var didSave =  NotificationCenter.default.publisher(for: .NSManagedObjectContextDidSave)
   
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(user.widgetArray, id: \.self) { widget in
                        WidgetItem(user: user, widget: widget, type: widget.type)
                    }.onMove(perform: onMove)
                }
                .listStyle(PlainListStyle())
                
                NavigationLink(destination: AddWidgetView(user: user)){
                    Text("Add Widgets")
                }
            }.padding(10)
            .navigationBarTitle("Today")
            .navigationBarItems(trailing:
                                    Button(action: toggleEdit){
                                        Text(editMode == EditMode.inactive ? "Edit" : "Done")
                                    }
            )
            .environment(\.editMode, $editMode)
        }
    }
    
    private func onMove(source: IndexSet, destination: Int) {
        user.widgetArray.move(fromOffsets: source, toOffset: destination)
    }
    
    func toggleEdit() {
        if editMode == EditMode.active {
            user.updateWidgetIndex()
        }
        editMode = editMode == EditMode.inactive ? EditMode.active : EditMode.inactive
    }
}

struct WidgetItem: View {
    @ObservedObject var user: User
    @ObservedObject var widget: Widget
    var type: String
    
    var body: some View {
        if !widget.isFault {
            switch widget.getState {
            case .weight:
                return AnyView(WeightWidget(user: user, healthStats: user.healthStats))
            case .bodyMeasurements:
                return AnyView(BodyMeasurementsWidget())
            case .gallery:
                return AnyView(GalleryWidget())
            default: // .mood
                return AnyView(MoodWidget())
            }
        } else {
            return AnyView(EmptyView())
        }
    }
}

//struct TodayView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodayView()
//    }
//}
