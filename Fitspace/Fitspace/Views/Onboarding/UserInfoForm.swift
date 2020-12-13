//
//  UserInfoForm.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//

import SwiftUI

struct UserInfoForm: View {
    @Binding var pushUserInfo: Bool
    @Binding var pushHealthInfo: Bool
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var dob: Date
    private var isValidTextField: Bool {
        !firstName.isEmpty && !lastName.isEmpty
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Fitspace")
                .font(.largeTitle).foregroundColor(Color.white)
                .padding([.top, .bottom], 24)
            
            TextField("First Name", text: $firstName)
                .modifier(FieldModifier())
            
            TextField("Last Name", text: $lastName)
                .modifier(FieldModifier())
            
            DatePicker("Birthday", selection: $dob, in: ...Date(),  displayedComponents: .date)
                .datePickerStyle(CompactDatePickerStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(16)
            
            Button(action: {
                pushUserInfo = false
                pushHealthInfo = true
            }) {
              Text("Next")
                .modifier(ButtonStyle(isValidTextField ? ViewConstants.defaultButtonColor : ViewConstants.errorButtonColor))
            }.disabled(!isValidTextField)
        }
        .padding(.horizontal)
        .modifier(OnboardingModifier())
    }
}

//struct UserInfoForm_Previews: PreviewProvider {
//    static var previews: some View {
//        UserInfoForm()
//    }
//}
