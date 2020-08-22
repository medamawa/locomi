//
//  UserView.swift
//  locomi
//
//  Created by sogo on 2020/05/14.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct UserView: View {
        
    var body: some View {
        
        if UserID().getID() != "" {
            
            UserInfo(id: UserID().getID())
            
        } else {
            
            Login()
        }
        
        
    }
    
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
