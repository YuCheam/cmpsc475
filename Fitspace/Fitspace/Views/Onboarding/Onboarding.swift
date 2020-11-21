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
    
    @State var weight: Double = 0.0
    @State var height: Int = 0
    
    
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
                
                Button(String("Next →")){
                    tabIndex += 1
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Color.white)
                .cornerRadius(12)
                
            }
            .tag(0)
            
            UserInfoForm(tabIndex: $tabIndex, firstName: $firstName, lastName: $lastName, dob: $dob)
                .tag(1)
            
            HealthInfoForm(tabIndex: $tabIndex, currentWeight: $weight, height: $height)
                .tag(2)
            
            VStack(spacing: 16) {
                Text("Start your fitness journey!")
                Text("\(firstName) \(lastName)")
                Text("Date of Birth: \(dob)")
                Text("Weight: \(weight)")
                Text("Height: \(height)")
                Button(action: {addUser()}){
                    Text("Create User")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                }
            }.tag(3)
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    
    func addUser() {
        let newUser = User(context: viewContext)
        let newHealthStats = HealthStats(context: viewContext)
        
        newUser.firstName = firstName
        newUser.lastName = lastName
        newUser.dob = dob
        newUser.healthStats =  newHealthStats
        
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
}

//struct Onboarding_Previews: PreviewProvider {
//    static var previews: some View {
//        Onboarding()
//    }
//}
