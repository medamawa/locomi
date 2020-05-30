//
//  Logout.swift
//  locomi
//
//  Created by sogo on 2020/05/16.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct Logout: View {
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    
                    Button(action: {
                        
                        AccessToken().removeToken()
                        RefreshToken().removeToken()
                        UserID().removeID()
                        
                    }) {
                        
                        Text("ログアウトする")
                        
                    }
                    
                }
                
            }
            .navigationBarTitle("ログアウト")
            
        }
        
    }
    
}

struct Logout_Previews: PreviewProvider {
    static var previews: some View {
        Logout()
    }
}
