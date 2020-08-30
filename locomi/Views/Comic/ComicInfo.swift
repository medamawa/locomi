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
    @State var profile_image: String?
    @State var comic: Comic?
    @State var favoriteIdList: [IdList] = []
    @State private var isFavorite = false
    @State private var showingModal = false
    @State private var selectedModal: Int?
        
    var body: some View {
        
        VStack {
            
            HStack {
                
                if profile_image == nil {
                    
                    Image("user_icon")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                        .padding(8)
                        .onTapGesture {
                            self.showingModal.toggle()
                            self.selectedModal = 1
                    }
                    
                }
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text("\(self.screen_name)")
                            .onTapGesture {
                                self.showingModal.toggle()
                                self.selectedModal = 1
                        }
                        Text("@\(self.name)")
                            .foregroundColor(.gray)
                            .onTapGesture {
                                self.showingModal.toggle()
                                self.selectedModal = 1
                        }
                    }
                    
                    Text("\(self.comic?.text ?? "")")
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .onTapGesture {
                            self.showingModal.toggle()
                            self.selectedModal = 2
                    }
                    
                    HStack {
                        
                        if !isFavorite {
                            Image(systemName: "heart")
                                .onTapGesture {
                                    self.isFavorite.toggle()
                                    let favoriteData = FavoriteData(comic_id: self.comic?.id ?? "")
                                    APIRequest().postFavorite(favoriteData)
                            }
                        } else {
                            Image(systemName: "heart.fill")
                                .onTapGesture {
                                    self.isFavorite.toggle()
                                    let favoriteData = FavoriteData(comic_id: self.comic?.id ?? "")
                                    APIRequest().postFavorite(favoriteData)
                            }
                        }
                        
                        Spacer()
                        
                        Image(systemName: "bubble.left")
                            .onTapGesture {
                                self.showingModal.toggle()
                                self.selectedModal = 4
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
                
                Utility().wait( { return self.comic?.user_id == nil } ) {
                    
                    APIRequest().getSpecifiedUser(self.comic!.user_id) { User in
                        self.screen_name = User[0].screen_name
                        self.name = User[0].name
                        self.profile_image = User[0].profile_image
                    }
                    
                }
                
                Utility().wait( { return self.comic?.id == nil } ) {
                    
                    let data = FavoriteData(comic_id: self.comic?.id ?? "")
//                    self.isFavorite = APIRequest().postIsFavorite(data)   エラーでうまく機能しないので、ひとまずオフにしておく
                    
                    print("/////////////////////////////////////")
                    print(self.isFavorite)
                    print("/////////////////////////////////////")
                    
                }
                
            }
            
            HStack {
                
                Text("いいねしたユーザー")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        self.showingModal.toggle()
                        self.selectedModal = 3
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
            
            if self.selectedModal == 1 {
                UserInfo(id: self.comic?.user_id ?? "")
            } else if self.selectedModal == 2 {
                ComicDetail(id: self.comic!.id, isShowing: self.$showingModal)
            } else if self.selectedModal == 3 {
                UsersList(title: "いいねしたユーザー", idList: self.favoriteIdList)
            } else if self.selectedModal == 4 {
                CommentView(comic_id: self.comic?.id ?? "", isShowing: self.$showingModal)
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
