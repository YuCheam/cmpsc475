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
    
    @State var isShowingLibrary: Bool = false
    @State var image = UIImage()
    
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
                
                Section(header: Text("Profile Picture")) {
                    HStack {
                        Button(action: {image = UIImage()}){
                            Text("Clear")
                                .modifier(ButtonStyle(ViewConstants.errorButtonColor))
                        }.buttonStyle(PlainButtonStyle())
                        
                        Button(action: {self.isShowingLibrary = true}){
                            Text("Add Image")
                                .modifier(ButtonStyle(ViewConstants.defaultButtonColor))
                        }.buttonStyle(PlainButtonStyle())
                    }
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 164, height: 164)
                }
                
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
            .sheet(isPresented: $isShowingLibrary) {
                ImagePicker(selectedImage: $image, sourceType: .photoLibrary)
            }
        }
    }
    
    func updateUserInfo() {
        user.firstName = firstName
        user.lastName = lastName
        user.dob = dob
        user.profileImage = image.jpegData(compressionQuality: 1.0)
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
