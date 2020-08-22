//
//  UserView.swift
//  locomi
//
//  Created by sogo on 2020/05/14.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct UserView: View {
    
    @State var showingLogin = true
        
    var body: some View {
        
        if UserID().getID() != "" {
            
            UserInfo(id: UserID().getID())
            
        } else {
            
            Login(isShowing: $showingLogin)
        }
        
        
    }
    
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
