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
    
    @State var pushUserInfo: Bool = false
    @State var pushHealthInfo: Bool = false
    @State var pushEndView: Bool = false
    
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
        NavigationView {
            ZStack{
                WelcomeView(pushUserInfo: $pushUserInfo)
                
                NavigationLink(destination: UserInfoForm(pushUserInfo: $pushUserInfo, pushHealthInfo: $pushHealthInfo, firstName: $firstName, lastName: $lastName, dob: $dob), isActive: $pushUserInfo){
                    EmptyView()
                }.hidden()
                
                NavigationLink(destination: HealthInfoForm(pushHealthInfo: $pushHealthInfo, pushEndView: $pushEndView, currentWeight: $weight, goalWeight: $goalWeight, height: $height), isActive: $pushHealthInfo){
                    EmptyView()
                }.hidden()
                
                NavigationLink(destination: EndOnboarding.modifier(OnboardingModifier()), isActive: $pushEndView) {
                    EmptyView()
                }.hidden()
            }
        }
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
        let newWidget = Widget(context: viewContext)
        newWidget.type = WidgetType.weight.rawValue
        newWidget.isSelected = true
        newWidget.index = Int32(0)
        
        user.addToWidgets(newWidget)
        
    }
    
    var EndOnboarding: some View {
        VStack(spacing: 24) {
            Text("Start your fitness journey!")
                .foregroundColor(.white)
                .font(.system(size: 36, weight: .bold, design: .default))
            
            VStack(alignment: .leading) {
                Text("\(firstName) \(lastName)")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .padding(.bottom, 8)
                Text("Date of Birth: \(formatDOB)")
                Text("Weight: \(weight, specifier: "%.1f") lbs")
                Text("Height: \(heightFormatted)")
            }.frame(maxWidth: .infinity, alignment: .leading)
            .modifier(FieldModifier())
            
            
            Button(action: {
                pushEndView = false
                addUser()
            }){
                Text("Create User")
                    .modifier(ButtonStyle(ViewConstants.defaultButtonColor))
            }
        }.padding(.horizontal)
    }
}

//struct Onboarding_Previews: PreviewProvider {
//    static var previews: some View {
//        Onboarding()
//    }
//}
