//
//  LoginView.swift
//  Let's Chat
//
//  Created by Hmoo Myat Theingi on 29/12/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email=""
    @State private var password=""

    var body: some View {
        VStack{
            TextField("Email", text: $email)
                .textInputAutocapitalization(.none)
            SecureField("Password", text: $password)
            
            Button {
                //
            } label: {
                Text("Login")
            }


        }
    }
}

#Preview {
    LoginView()
}
