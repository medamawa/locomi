//
//  UserInfo.swift
//  locomi
//
//  Created by sogo on 2020/04/30.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct UserInfo: View {
    
    @State var id = ""
    @State var screen_name = ""
    @State var name = ""
    @State var email = ""
    
    var body: some View {
        
        VStack {
            
            Text(self.id)
            Text(self.screen_name)
            Text(self.name)
            Text(self.email)
            Button(action: {
                APIRequest().postFollow(self.id)
                }
            ) {
                
                Text("Follow / Unfollowする")
                
            }
            
        }
        .onAppear {
            APIRequest().getSpecifiedUser(self.id) { User in
                self.id = User[0].id
                self.screen_name = User[0].screen_name
                self.name = User[0].name
                self.email = User[0].email
            }
            
        }
        
    }
    
}

struct UserInfo_Previews: PreviewProvider {
    static var previews: some View {
        UserInfo()
    }
}
