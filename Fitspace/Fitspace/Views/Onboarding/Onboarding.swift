//
//  Onboarding.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/15/20.
//

import SwiftUI

struct Onboarding: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var tabIndex = 0
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var dob: Date = Date()
    
    @State var weight: Float = 0.0
    @State var goalWeight: Float = 0.0
    @State var height: Int = 0
    
    var heightFormatted: String {
        let inches = height % 12
        let feet = (height-inches)/12
        return "\(feet)'\(inches)''"
    }
    
    var formatDOB: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: dob)
    }
    
    var body: some View {
        TabView(selection: $tabIndex) {
            VStack(spacing: 20) {
                Text("Fitspace")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                Text("Create an account")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Button(action: {tabIndex += 1}, label: {
                    Text("Next →")
                        .modifier(ButtonStyle(ViewConstants.defaultButtonColor))
                })
                
            }
            .tag(0)
            
            UserInfoForm(tabIndex: $tabIndex, firstName: $firstName, lastName: $lastName, dob: $dob)
                .tag(1)
            
            HealthInfoForm(tabIndex: $tabIndex, currentWeight: $weight, goalWeight: $goalWeight, height: $height)
                .tag(2)
            
            VStack(spacing: 24) {
                Text("Start your fitness journey!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Group {
                    Text("\(firstName) \(lastName)")
                    Text("Date of Birth: \(formatDOB)")
                    Text("Weight: \(weight, specifier: "%.1f") lbs")
                    Text("Height: \(heightFormatted)")
                }
                
                Button(action: {addUser()}){
                    Text("Create User")
                        .modifier(ButtonStyle(ViewConstants.defaultButtonColor))
                }
            }.tag(3)
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    
    func addUser() {
        let newUser = User(context: viewContext)
        let newHealthStats = HealthStats(context: viewContext)
        let journal = Journal(context: viewContext)
        
        newUser.firstName = firstName
        newUser.lastName = lastName
        newUser.dob = dob
        newUser.healthStats =  newHealthStats
        newUser.journal = journal
        newUser.goalWeight = goalWeight
        createWidgets(user: newUser)
        
        newHealthStats.height = height
        
        let newWeight = Weight(context: viewContext)
        newWeight.userHealthStats = newHealthStats
        newWeight.amount = weight
        newWeight.date = Date()
        
        let userdefaults = UserDefaults.standard
        let key = "needsUserCreation"
        do {
            try viewContext.save()
            userdefaults.set(false, forKey: key)
        } catch {
            print("User could not be created")
        }
    }
    
    func createWidgets(user: User) {
        let widgets = WidgetType.allCases
        for i in 0..<widgets.count {
            let newWidget = Widget(context: viewContext)
            newWidget.type = widgets[i].rawValue
            newWidget.isSelected = false
            newWidget.index = Int32(i)
            
            user.addToWidgets(newWidget)
        }
    }
}

//struct Onboarding_Previews: PreviewProvider {
//    static var previews: some View {
//        Onboarding()
//    }
//}
