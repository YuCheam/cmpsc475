//
//  EditProfileView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var user: User
    @Binding var sheet: Bool
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var dob: Date = Date()
    
    var body: some View {
        NavigationView {
            Form {
                HStack {
                    Text("First Name: ")
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disableAutocorrection(true)
                        .padding()
                        .background(Color.white)
                                        }
                
                HStack {
                    Text("Last Name: ")
                    TextField("Last Name", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disableAutocorrection(true)
                        .padding()
                        .background(Color.white)
                }
                
                DatePicker("Birthday", selection: $dob, in: ...Date(),  displayedComponents: .date)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                
                
                HStack {
                    Button(action: {sheet.toggle()}){
                        Text("Dismiss")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 150, height: 50)
                            .background(Color.red)
                            .cornerRadius(15.0)
                    }.buttonStyle(PlainButtonStyle())
                    
                    Button(action: {updateUserInfo()}){
                        Text("Update Profile")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 150, height: 50)
                            .background(Color.green)
                            .cornerRadius(15.0)
                    }.buttonStyle(PlainButtonStyle())
                }
            }.navigationBarTitle("Edit Profile")
            .onAppear {
                self.firstName = user.firstName
                self.lastName = user.lastName
                self.dob = user.dob
            }
        }
    }
    
    func updateUserInfo() {
        user.firstName = firstName
        user.lastName = lastName
        user.dob = dob
        sheet.toggle()
        
        do {
            try viewContext.save()
        } catch {
            print("User could not be updated")
        }
    }
}

//struct EditProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView()
//    }
//}
