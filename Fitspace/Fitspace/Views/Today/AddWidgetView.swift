//
//  AddWidgetView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/11/20.
//

import SwiftUI

struct WidgetSelectionItem: Identifiable {
    var type: WidgetType
    var isSelected: Bool
    var id = UUID()
}

struct AddWidgetView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var user: User
    @State var options: [WidgetSelectionItem] = []
    
    var body: some View {
        List {
            ForEach(Array(options.enumerated()), id: \.element.id) {index, option in
                Button(action: {options[index].isSelected.toggle()}){
                    HStack {
                        Text(option.type.rawValue)
                        Spacer()
                        Image(systemName: "checkmark")
                            .opacity(options[index].isSelected ? 1.0 : 0.0)
                    }
                }
            }
        }.navigationBarTitle("Select Widgets")
        .onAppear(){
            let array = WidgetType.allCases
            for i in 0..<array.count {
                let newItem = WidgetSelectionItem(type: array[i], isSelected: user.containsWidget(array[i]))
                options.append(newItem)
            }
        }
        .onDisappear(){
            self.updateWidgets()
        }
    }
    
    func updateWidgets() {
        // Add new widgets
        for item in options.filter({$0.isSelected}) {
            if !user.containsWidget(item.type) {
                let newWidget = Widget(context: viewContext)
                newWidget.type = item.type.rawValue
                newWidget.isSelected = true
                newWidget.index = Int32(user.widgetArray.count)
                
                user.addToWidgets(newWidget)
                
                do {
                   try viewContext.save()
                } catch {
                    print("Can't add widget")
                }
            }
        }
        
        for i in 0..<user.widgetArray.count {
            let doesContain = options.filter({$0.isSelected}).contains(where: {$0.type.rawValue == user.widgetArray[i].type})
            if  !doesContain {
                viewContext.delete(user.widgetArray[i])
                user.widgetArray.remove(at: i)
                
                do {
                   try viewContext.save()
                } catch {
                    print("Can't delete widget")
                }
            }
        }
        
        user.setWidgetArray()
    }
        
        //    private func onMove(source: IndexSet, destination: Int) {
//        user.widgetArray.move(fromOffsets: source, toOffset: destination)
//        user.updateWidgetIndex()
//    }
    
}


//struct AddWidgetView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddWidgetView()
//    }
//}
