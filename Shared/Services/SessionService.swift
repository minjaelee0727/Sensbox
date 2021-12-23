//
//  File.swift
//  Sensbox (iOS)
//
//  Created by Min Jae Lee on 2021-11-15.
//

import Foundation
import FirebaseAuth

enum SessionState {
    case loggedIn
    case loggedOut
}

final class SessionService: ObservableObject {
    @Published var state: SessionState = .loggedOut
    @Published var userProfile: NSDictionary?
    
    private var handler: AuthStateDidChangeListenerHandle?
    private let firebaseAuth = Auth.auth()
    
    init() {
        setupFirebaseAuthHandler()
    }
    
    private func setLoggedOut() {
        self.state = .loggedOut
    }
    
    private func setLoggedIn() {
        self.state = .loggedIn
    }
    
    public func logout() {
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

private extension SessionService {
    func setupFirebaseAuthHandler() {
        handler = firebaseAuth
            .addStateDidChangeListener {
                [weak self] res, user in
                guard let self = self else { return }
                
                if let user = user {
                    print(user)
                    self.setLoggedIn()
                    self.handleRefresh(with: user.uid)
                }
            }
    }
    
    func handleRefresh(with uid: String) {
        DatabaseService.userDoc(uid).getData {
            (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
                return
            }
            
            if snapshot.exists() {
                self.userProfile = snapshot.value as? NSDictionary
            }
            else {
                print("No user data available")
            }
        }
    }
}
