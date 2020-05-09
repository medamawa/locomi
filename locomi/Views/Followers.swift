//
//  Followers.swift
//  locomi
//
//  Created by sogo on 2020/05/01.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct Followers: View {
    @State var followers: [FollowsResponseData] = []
    @State var userInfo: [String: User] = [ : ]
    
    var body: some View {
        
        List(followers) { follower in
            
            VStack {
                
                Text(follower.id)
                Text(self.userInfo[follower.id]?.screen_name ?? "")
                Text(self.userInfo[follower.id]?.name ?? "")
                Text(self.userInfo[follower.id]?.email ?? "")
                
            }
            .onAppear {
                
                APIRequest().getSpecifiedUser(follower.id) { User in
                    self.userInfo[follower.id] = User[0]
                }
                
            }
            
        }
        .onAppear {
            
            APIRequest().getFollowers { (followers) in
                self.followers = followers
            }
            
        }
        
    }
    
}

struct Followers_Previews: PreviewProvider {
    static var previews: some View {
        Followers()
    }
}
