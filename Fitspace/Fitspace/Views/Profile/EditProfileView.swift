//
//  EditProfileView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var user: User
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var dob: Date = Date()
    
    @State var isShowingLibrary: Bool = false
    @State var image = UIImage()
    
    var body: some View {
        Form {
            Section(header: Text("Profile Information")) {
                TextField("First Name", text: $firstName)

                TextField("Last Name", text: $lastName)
                
                DatePicker("Birthday", selection: $dob, in: ...Date(),  displayedComponents: .date)
            }
            
            Section(header: Text("Profile Picture")) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 164, height: 164)
                
                Button(action: {image = UIImage()}){
                    Text("Clear")
                }
                Button(action: {self.isShowingLibrary = true}){
                    Text("Add Image")
                }
            }
            
            Section(header: Text("Modify")) {
                Button(action: {updateUserInfo()}){
                    Text("Update Profile")
                }
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
    
    func updateUserInfo() {
        user.firstName = firstName
        user.lastName = lastName
        user.dob = dob
        user.profileImage = image.jpegData(compressionQuality: 1.0)
        presentationMode.wrappedValue.dismiss()
        
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
