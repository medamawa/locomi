//
//  CommentInfo.swift
//  locomi
//
//  Created by sogo on 2020/05/14.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct CommentInfo: View {
    
    @State var comment: Comment
    @State var screen_name = "---"
    @State var name = "---"
    @State private var showingUserInfo = false
    
    var body: some View {
        
        HStack {
            
            Image("user_icon")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
                .padding(8)
                .onTapGesture {
                    self.showingUserInfo.toggle()
            }
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text("\(self.screen_name)")
                        .onTapGesture {
                            self.showingUserInfo.toggle()
                    }
                    Text("@\(self.name)")
                        .foregroundColor(.gray)
                        .onTapGesture {
                            self.showingUserInfo.toggle()
                    }
                }
                
                Text("\(self.comment.text)")
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                
                HStack {
                    
                    Image(systemName: "heart.slash")
                    
                    Spacer()
                    
                    Image(systemName: "bubble.left")
                    
                    Spacer()
                    
                    Image(systemName: "square.and.arrow.up")
                    
                }
                .foregroundColor(.gray)
                .padding(8)
                
            }
            
        }
        .padding(8)
        .sheet(isPresented: self.$showingUserInfo) {
            UserInfo(id: self.comment.user_id)
        }
        .onAppear {
            
            APIRequest().getSpecifiedUser(self.comment.user_id) { User in
                self.screen_name = User[0].screen_name
                self.name = User[0].name
            }
            
        }
        
    }
    
}
