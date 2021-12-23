//
//  LoginViewModel.swift
//  Sensbox (iOS)
//
//  Created by Min Jae Lee on 2021-11-15.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errMsg: String = ""

    func login() {
        self.errMsg.removeAll()
        
        AuthService.signIn(email: email, password: password) {
            result in
            
            switch result {
            case.failure(AuthError.error(let err)):
                self.errMsg = err
            default:
                break
            }
        }
    }
}
