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
    @Binding var tabIndex: Int
    @Binding var viewMode: HealthViewState
   
    var body: some View {
        NavigationView {
            List {
                ForEach(user.widgetArray, id: \.self) { widget in
                    Button(action: {navigate(type: widget.type)}) {
                        WidgetItem(user: user, widget: widget, type: widget.type)
                    }.buttonStyle(PlainButtonStyle())
                    .padding([.top, .bottom], 10)
                }.onMove(perform: onMove)
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Today")
            .navigationBarItems(trailing:
                                    HStack {
                                        NavigationLink(destination: AddWidgetView(user: user)){
                                            Label("Add", systemImage: "plus")
                                        }
                                        Button(action: toggleEdit){
                                            Text(editMode == EditMode.inactive ? "Edit" : "Done")
                                        }
                                    }
            )
            .environment(\.editMode, $editMode)
        }
    }
    
    private func onMove(source: IndexSet, destination: Int) {
        user.widgetArray.move(fromOffsets: source, toOffset: destination)
    }
    
    func navigate(type: String) {
        switch WidgetType(rawValue: type)! {
        case .weight:
            tabIndex = 1
            viewMode = .weight
        case .bodyMeasurements:
            tabIndex = 1
            viewMode = .bodyMeasurements
        case .mood:
            tabIndex = 2
        default: // .gallery
            tabIndex = 1
            viewMode = .pictures
        }
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
        if !widget.isFault && !user.isFault {
            switch widget.getState {
            case .weight:
                return AnyView(WeightWidget(user: user, healthStats: user.healthStats))
            case .bodyMeasurements:
                return AnyView(BodyMeasurementsWidget(healthStats: user.healthStats))
                
            case .gallery:
                return AnyView(GalleryWidget(healthStats: user.healthStats))
                
            default: // .mood
                return AnyView(MoodWidget(journal: user.journal))
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
