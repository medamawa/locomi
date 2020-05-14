//
//  ComicDetail.swift
//  locomi
//
//  Created by sogo on 2020/05/12.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct ComicDetail: View {
    
    @State var comic: Comic
    @State var comments: [Comment]?
    @State var favoriteIdList: [IdList] = []
    @State var screen_name = "---"
    @State var name = "---"
    @State private var showingUserInfo = false
    @State private var showingFavoriteUserList = false
        
    var body: some View {
        
        VStack {
            
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
                    
                    Text("\(self.comic.text)")
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    HStack {
                        
                        Image(systemName: "heart")
                            .onTapGesture {
                                let favoriteData = FavoriteData(comic_id: self.comic.id)
                                APIRequest().postFavorite(favoriteData)
                            }
                        
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
                UserInfo(id: self.comic.user_id)
            }
            .onAppear {
                
                APIRequest().getSpecifiedUser(self.comic.user_id) { User in
                    self.screen_name = User[0].screen_name
                    self.name = User[0].name
                }
                
            }
            
            HStack {
                
                Text("いいねしたユーザー")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        self.showingFavoriteUserList.toggle()
                }
                
            }
            .sheet(isPresented: self.$showingFavoriteUserList) {
                UsersList(title: "いいねしたユーザー", idList: self.favoriteIdList)
            }
            .onAppear {
                
                APIRequest().getComicDetail(self.comic.id) { Data in
                    Data.favorites?.forEach {user in
                        self.favoriteIdList.append(IdList(id: user.user_id))
                    }
                    
                }
                
            }
            
        }
        
    }
    
}


struct ComicDetail_Previews: PreviewProvider {
    static var previews: some View {
        ComicsList()
    }
}
