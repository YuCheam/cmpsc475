//
//  AddGoalView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/22/20.
//

import SwiftUI

struct AddGoalView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var user: User
    @State var goalTitle: String = ""
    @State var goalText: String =  "details"
    @State var endDate: Date = Date()
    @State var isDateOn: Bool = false
    
    var body: some View {
        Form {
            Section(header: Text("Goal Details")){
                TextField("Goal Title", text: $goalTitle)
                TextEditor(text: $goalText)
            }
            
            Section(header: Text("Dates")){
                Toggle("Add Goal End Date", isOn: $isDateOn)
                DatePicker("Finish By", selection: $endDate, in: Date()..., displayedComponents: .date)
                    .opacity(isDateOn ? 1.0 : 0.0)
            }
            
            Section {
                Button("Add Goal"){
                    addGoal()
                    self.presentationMode.wrappedValue.dismiss()
                }
                
                Button("Cancel") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }.navigationBarTitle("Add Goal")
    }
    
    func addGoal() {
        let newGoal = Goal(context: viewContext)
        newGoal.details = goalText
        newGoal.title = goalTitle
        
        if isDateOn {
            newGoal.startDate = Date()
            newGoal.endDate = endDate
        }
        
        user.addToGoals(newGoal)
        do {
            try viewContext.save()
        } catch {
            print("Goal could not be created")
        }
    }
}

//struct AddGoalView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddGoalView()
//    }
//}
