//
//  Users.swift
//  locomi
//
//  Created by sogo on 2020/05/14.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct Users: View {
    
    @State var users: [User] = []
    @State private var showingUserInfo = false
    
    var body: some View {
        
        List(users) { user in
            
            HStack {
                
                if user.profile_image == nil {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 75))
                }
                
                VStack(alignment: .leading) {
                    
                    Text(user.screen_name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("@" + String(user.name))
                        .font(.footnote)
                        .lineLimit(0)
                    Text(user.email)
                        .font(.callout)
                    Text(user.id)
                        .font(.caption)
                        .fontWeight(.light)
                        .foregroundColor(Color.gray)
                    Button(action: { self.showingUserInfo.toggle() }) {
                        Text("Tap to show detail")
                    }.sheet(isPresented: self.$showingUserInfo) {
                        UserInfo(id: user.id)
                    }
                    
                }
                
            }
            
        }
        .onAppear {
            
            APIRequest().getUsers { (users) in
                self.users = users
            }
            
        }
        
    }
    
}

struct Users_Previews: PreviewProvider {
    static var previews: some View {
        Users()
    }
}
