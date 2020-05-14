//
//  ComicDetail.swift
//  locomi
//
//  Created by sogo on 2020/05/12.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct ComicInfo: View {
    
    // comicまたはidのどちらかを選べる（comicの方が望ましい）
    @State var id = ""
    @State var screen_name = "---"
    @State var name = "---"
    @State var comic: Comic?
    @State var favoriteIdList: [IdList] = []
    @State private var showingModal = false
    @State private var showingUserInfo = false
    @State private var showingComicDetail = false
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
                        self.showingModal.toggle()
                        self.showingUserInfo.toggle()
                }
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text("\(self.screen_name)")
                            .onTapGesture {
                                self.showingModal.toggle()
                                self.showingUserInfo.toggle()
                        }
                        Text("@\(self.name)")
                            .foregroundColor(.gray)
                            .onTapGesture {
                                self.showingModal.toggle()
                                self.showingUserInfo.toggle()
                        }
                    }
                    
                    Text("\(self.comic?.text ?? "")")
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .onTapGesture {
                            self.showingModal.toggle()
                            self.showingComicDetail.toggle()
                    }
                    
                    HStack {
                        
                        Image(systemName: "heart")
                            .onTapGesture {
                                let favoriteData = FavoriteData(comic_id: self.comic?.id ?? "")
                                APIRequest().postFavorite(favoriteData)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "bubble.left")
                            .onTapGesture {
                                self.showingModal.toggle()
                                self.showingComicDetail.toggle()
                        }
                        
                        Spacer()
                        
                        Image(systemName: "square.and.arrow.up")
                        
                    }
                    .foregroundColor(.gray)
                    .padding(8)
                    
                }
                
            }
            .padding(8)
            .onAppear {
                
                Utility().wait( { return self.comic?.user_id == nil }) {
                    
                    APIRequest().getSpecifiedUser(self.comic!.user_id) { User in
                        self.screen_name = User[0].screen_name
                        self.name = User[0].name
                    }
                    
                }
                
            }
            
            HStack {
                
                Text("いいねしたユーザー")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        self.showingModal.toggle()
                        self.showingFavoriteUserList.toggle()
                }
                
            }
            .onAppear {
                
                Utility().wait( { return self.comic?.id == nil }) {
                    
                    APIRequest().getComicDetail(self.comic!.id) { Data in
                        Data.favorites?.forEach {user in
                            self.favoriteIdList.append(IdList(id: user.user_id))
                        }
                        
                    }
                    
                }
                
            }
            
        }
        .sheet(isPresented: self.$showingModal) {
            
            if self.showingUserInfo {
                UserInfo(id: self.comic?.user_id ?? "")
            } else if self.showingComicDetail {
                ComicDetail(id: self.comic!.id)
            } else if self.showingFavoriteUserList {
                UsersList(title: "いいねしたユーザー", idList: self.favoriteIdList)
            }
            
        }
        .onAppear {
            
            if self.comic == nil {
                
                APIRequest().getComicDetail(self.id) { Data in
                    self.comic = Data.comic.first!
                }
                
            }
            
        }
        
    }
    
}


struct ComicInfo_Previews: PreviewProvider {
    static var previews: some View {
        ComicsList()
    }
}
