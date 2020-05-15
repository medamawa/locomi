//
//  Follows.swift
//  locomi
//
//  Created by sogo on 2020/05/01.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct Follows: View {
    @State var follows: [FollowsResponseData] = []
    @State var followsIdList: [IdList] = []
    @State private var showingFollowsList = false
    
    var body: some View {
        
        VStack {
            
            if showingFollowsList {
                UsersList(title: "フォローしているユーザー", idList: self.followsIdList)
            }
            
        }
        .onAppear {
            
            APIRequest().getFollows { follows in
                self.follows = follows
                follows.forEach { user in
                    self.followsIdList.append(IdList(id: user.id))
                }
                self.showingFollowsList = true

            }
            
        }
        
    }
    
}

struct Follows_Previews: PreviewProvider {
    static var previews: some View {
        Follows()
    }
}
