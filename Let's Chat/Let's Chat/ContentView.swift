//
//  ContentView.swift
//  Let's Chat
//
//  Created by Hmoo Myat Theingi on 29/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Let's Chat")
                
                NavigationLink {
                    RegisterView()
                } label: {
                    Text("Register")
                }
                NavigationLink {
                    LoginView()
                } label: {
                    Text("Login")
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
