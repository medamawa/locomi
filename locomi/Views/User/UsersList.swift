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
    @State var id = ""
    @State var idList: [IdList] = []
    @State var usersInfo: [String: User] = [ : ]
    @State private var showingUserInfo = false
    
    var body: some View {
        
        VStack {
            
            Text(self.title)
                .font(.title)
            
            List(idList) { user_id in
                
                HStack {
                    
                    Image("user_icon")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                        .padding(8)
                    
                    VStack(alignment: .leading) {
                        
                        HStack {
                            
                            Text("\(self.usersInfo[user_id.id]?.screen_name ?? "---")")
                            Text("@\(self.usersInfo[user_id.id]?.name ?? "---")")
                            
                        }
                        
                    }
                    
                }
                .onTapGesture {
                    self.showingUserInfo.toggle()
                    self.id = user_id.id
                }
                .sheet(isPresented: self.$showingUserInfo) {
                    UserInfo(id: self.id)
                }
                .onAppear {
                    
                    APIRequest().getSpecifiedUser(user_id.id) { User in
                        self.usersInfo[user_id.id] = User.first
                    }
                    print("###############")
                    print(self.idList)
                    print(self.usersInfo)
                    print(user_id.id)
                    print("###############")
                    
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
