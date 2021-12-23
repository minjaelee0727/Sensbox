//
//  AuthService.swift
//  Sensbox
//
//  Created by Min Jae Lee on 2021-10-11.
//

import Foundation
import FirebaseAuth

enum AuthError: Error {
    case error(description: String)
    case unknown
}

class AuthService {
    static func signIn(email: String, password: String, completion: @escaping (Result<Void, AuthError>) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) {
            (authResult, error) in
            
            if let error = error {
                completion(.failure(AuthError.error(description: error.localizedDescription)))
            }
        
            completion(.success(()))
        }
    }

}
