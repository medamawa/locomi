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
    @State var followersIdList: [IdList] = []
    @State private var showingFollowersList = false
    
    var body: some View {
        
        VStack {
            
            if showingFollowersList {
                UsersList(title: "フォロワー", idList: self.followersIdList)
            }
            
        }
        .onAppear {
            
            APIRequest().getFollowers { followers in
                self.followers = followers
                followers.forEach { user in
                    self.followersIdList.append(IdList(id: user.id))
                }
                self.showingFollowersList = true

            }
            
        }
        
    }
    
}

struct Followers_Previews: PreviewProvider {
    static var previews: some View {
        Followers()
    }
}
