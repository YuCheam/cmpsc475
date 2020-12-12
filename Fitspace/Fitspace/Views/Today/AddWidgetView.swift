//
//  AddWidgetView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/11/20.
//

import SwiftUI

struct AddWidgetView: View {
    @ObservedObject var user: User
    @State private var editMode = EditMode.inactive
    
    var body: some View {
        List {
            ForEach(user.widgetArray, id: \.self) { widget in
                WidgetItemRow(widget: widget)
            }
            .onMove(perform: onMove)
            
        }.navigationBarTitle("Add Widgets")
        .navigationBarItems(trailing: EditButton())
        .environment(\.editMode, $editMode)
        
    }
    
    private func onMove(source: IndexSet, destination: Int) {
        user.widgetArray.move(fromOffsets: source, toOffset: destination)
        user.updateWidgetIndex()
    }
    
}

struct WidgetItemRow: View {
    @ObservedObject var widget: Widget
    var body: some View {
        Button(action: {widget.isSelected.toggle()}) {
            HStack {
                Text(widget.type)
                Spacer()
                Image(systemName: "checkmark").opacity(widget.isSelected ? 1.0 : 0.0)
            }
        }
    }
}

//struct AddWidgetView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddWidgetView()
//    }
//}
