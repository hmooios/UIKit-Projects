//
//  Let_s_ChatApp.swift
//  Let's Chat
//
//  Created by Hmoo Myat Theingi on 29/12/2023.
//

import SwiftUI
import FirebaseCore

@main
struct Let_s_ChatApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
