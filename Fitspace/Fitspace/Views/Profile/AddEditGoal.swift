//
//  AddGoalView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/22/20.
//

import SwiftUI

struct AddEditGoal: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var goal : Goal?
    var user: User
    @State var goalTitle: String = ""
    @State var goalText: String =  ""
    @State var endDate: Date = Date()
    @State var isDateOn: Bool = false
    
    var body: some View {
        Form {
            Section(header: Text("Title")){
                TextField("Goal Title", text: $goalTitle)
            }
            
            Section(header: Text("Details")){
                TextEditor(text: $goalText)
                    .foregroundColor(Color.gray)
                    .frame(height: 100)
            }
            
            Section(header: Text("Dates")){
                Toggle("Add Goal End Date", isOn: $isDateOn)
                DatePicker("Finish By", selection: $endDate, in: Date()..., displayedComponents: .date)
                    .opacity(isDateOn ? 1.0 : 0.0)
            }
            
            Section(header: Text("Modify")) {
                HStack {
                    Button("Cancel") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 150, height: 50)
                    .background(Color.red)
                    .cornerRadius(15.0)
                    
                    Spacer()
                    
                    Button(goal == nil ? "Add Goal" : "Save Changes"){
                        goal == nil ? addGoal() : editGoal()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 150, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
                }
            }
        }.navigationBarTitle(goal == nil ? "Add Goal" : "Edit Goal")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            if goal != nil {
                goalTitle = goal!.title
                goalText = goal!.details
                
                if goal?.endDate != nil {
                    endDate = goal!.endDate!
                    isDateOn = true
                }
            }
        }
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
    
    func editGoal() {
        goal!.setValue(goalText, forKey: "details")
        goal!.setValue(goalTitle, forKey: "title")
        
        if isDateOn {
            goal!.setValue(endDate, forKey: "endDate")
        } else {
            goal!.setValue(nil, forKey: "endDate")
        }
        
        do {
            try viewContext.save()
        } catch {
            print("Goal could not be editted")
        }
    }
}

//struct AddGoalView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddGoalView()
//    }
//}
