//
//  Database.swift
//  Sensbox
//
//  Created by Min Jae Lee on 2021-10-11.
//

import Foundation
import FirebaseDatabase

final class DatabaseService {
    private static let ref: DatabaseReference = Database.database().reference()
    
    static func userDoc(_ uid: String) -> DatabaseReference {
        return self.ref.child("Users/\(uid)")
    }
}
