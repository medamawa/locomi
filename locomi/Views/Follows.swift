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
    @State var userInfo: [String: User] = [ : ]
    
    var body: some View {
        
        List(follows) { follow in
            
            VStack {
                
                Text(follow.id)
                Text(self.userInfo[follow.id]?.screen_name ?? "")
                Text(self.userInfo[follow.id]?.name ?? "")
                Text(self.userInfo[follow.id]?.email ?? "")
                
            }
            .onAppear {
                
                APIRequest().getSpecifiedUser(follow.id) { User in
                    self.userInfo[follow.id] = User[0]
                }
                
            }
            
        }
        .onAppear {
            
            APIRequest().getFollows { (follows) in
                self.follows = follows
            }
            
        }
        
    }
    
}

struct Follows_Previews: PreviewProvider {
    static var previews: some View {
        Follows()
    }
}
