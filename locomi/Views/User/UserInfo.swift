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
    @State var screen_name = "---"
    @State var name = "---"
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Image("user_icon")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                    .padding(8)
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        
                        Text("\(self.screen_name)")
                        Text("@\(self.name)")
                        
                    }
                    
                }
                
            }
            
            Button(action: {
                APIRequest().postFollow(self.id)
            }
            ) {
                
                Text("Follow / Unfollowする")
                
            }
            
            SpecifiedUserComicsList(user_id: self.id)
            
        }
        .onAppear {
            APIRequest().getSpecifiedUser(self.id) { User in
                self.screen_name = User[0].screen_name
                self.name = User[0].name
                
                print("###################### userInfo")
                print(self.id)
                print("###################### userInfo ###")
            }
            
        }
        
    }
    
}

struct UserInfo_Previews: PreviewProvider {
    static var previews: some View {
        UserInfo()
    }
}
