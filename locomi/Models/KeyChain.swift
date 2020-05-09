//
//  Keychain.swift
//  locomi
//
//  Created by sogo on 2020/04/27.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import Foundation
import KeychainAccess

class AccessToken {
    
    let keychain = Keychain()
    
    func saveToken(token: String) {
        
        keychain["AccessToken"] = token
        
    }
    
    func getToken() -> String {
        
        guard let token = keychain["AccessToken"] else { return "" }
        
        return token
        
    }
    
}

class UserID {
    
    let keychain = Keychain()
    
    func saveID(id: String) {
        
        keychain["ID"] = id
        
    }
    
    func getID() -> String {
        
        guard let id = keychain["ID"] else { return "" }
        
        return id
        
    }
    
}
