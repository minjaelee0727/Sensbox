//
//  SensboxApp.swift
//  Shared
//
//  Created by Min Jae Lee on 2021-10-02.
//

import SwiftUI
import Firebase

@main
struct SensboxApp: App {
    @UIApplicationDelegateAdaptor(Delegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// Connecting Firebase ...

class Delegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
