//
//  UsersList.swift
//  locomi
//
//  Created by sogo on 2020/04/27.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct UsersList: View {
    @State var title = ""
    @State var idList: [IdList] = []
    @State var usersInfo: [String: User] = [ : ]
    
    var body: some View {
        
        VStack {
            
            Text(self.title)
                .font(.title)
            
            List(idList) { userId in
                
                HStack {
                    
                    Image("user_icon")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                        .padding(8)
                    
                    VStack(alignment: .leading) {
                        
                        HStack {
                            
                            Text("\(self.usersInfo[userId.id]?.screen_name ?? "---")")
                            Text("@\(self.usersInfo[userId.id]?.name ?? "---")")
                            
                        }
                        
                    }
                    
                }
                .onAppear {
                    
                    APIRequest().getSpecifiedUser(userId.id) { User in
                        self.usersInfo[userId.id] = User.first
                    }
                    
                }
                
            }
            
        }
        
    }
    
}

struct UsersList_Previews: PreviewProvider {
    static var previews: some View {
        UsersList()
    }
}
