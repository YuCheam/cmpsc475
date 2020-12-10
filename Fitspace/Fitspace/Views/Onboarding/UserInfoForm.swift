//
//  UserInfoForm.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//

import SwiftUI

struct UserInfoForm: View {
    @Binding var tabIndex: Int
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
                .disableAutocorrection(true)
                .padding()
                .background(Color.white)
                .cornerRadius(16)
            
            TextField("Last Name", text: $lastName)
                .disableAutocorrection(true)
                .padding()
                .background(Color.white)
                .cornerRadius(16)
            
            DatePicker("Birthday", selection: $dob, in: ...Date(),  displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(16)
            
            Button(action: {
                tabIndex += 1
            }) {
              Text("Next")
                .modifier(ButtonStyle(isValidTextField ? ViewConstants.defaultButtonColor : ViewConstants.errorButtonColor))
            }.disabled(!isValidTextField)
        }
        .padding(.horizontal)
    }
}

//struct UserInfoForm_Previews: PreviewProvider {
//    static var previews: some View {
//        UserInfoForm()
//    }
//}
