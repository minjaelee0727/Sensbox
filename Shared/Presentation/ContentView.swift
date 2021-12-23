//
//  ContentView.swift
//  Shared
//
//  Created by Min Jae Lee on 2021-10-02.
//

import SwiftUI

struct ContentView: View {
    @AppStorage(AppStorageData.DID_LAUNCH_BEFORE) private var didLaunchBefore = false
    @StateObject var sessionService = SessionService()
    
    var body: some View {
        Group {
            if didLaunchBefore {
                if sessionService.state == SessionState.loggedIn {
                    MainView()
                        .environmentObject(sessionService)
                } else {
                    LoginView()
                }
            } else {
                OnBoardingView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
