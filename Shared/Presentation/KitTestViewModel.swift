//
//  KitTestViewModel.swift
//  Sensbox (iOS)
//
//  Created by Min Jae Lee on 2021-11-16.
//

import Foundation

class KitTestViewModel: ObservableObject {
    @Published var variableResult: Int?
    @Published var xResult: Int?
    @Published var yResult: Int?
    @Published var zResult: Int?
    
    var session: SessionService?
    
    func setup(session: SessionService) {
        self.session = session
    }
    
    
}
