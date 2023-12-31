//
//  RegisterView.swift
//  Let's Chat
//
//  Created by Hmoo Myat Theingi on 29/12/2023.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
//import FirebaseFirestore
//import FirebaseAuth
      

struct RegisterView: View {
    @State private var email=""
    @State private var password=""

    var body: some View {
        VStack{
            TextField("Email", text: $email)
                .autocapitalization(.none) 
            SecureField("Password", text: $password)
            
            Button {
                createNewAccount()
            } label: {
                Text("Register")
            }


        }
    }
    
    private func createNewAccount(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let err = error{
                print("Failed to create user:",err)
                return
            }
            
            print("successfully created user: \(result?.user.uid ?? "")")

        }
    }

}

#Preview {
    RegisterView()
}
