//
//  ComicInfo.swift
//  locomi
//
//  Created by sogo on 2020/05/01.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct ComicInfo: View {
    @State var id = ""
    @State var comic: Comic?
    @State var comicUserID: String = ""
    @State var comments: [Comment]?
    @State var favorites: [Favorite]?
    @State var comicUserInfo: User?
    @State var commentUserInfo: [String: User] = [ : ]
    @State var favoriteUserInfo: [String: User] = [ : ]
    @State var showingUserInfo = false
    
    var body: some View {
        
        VStack {
            
            Group {
                Text("投稿情報")
                    .font(.largeTitle )
                
                Group {
                    Text("ユーザー")
                        .font(.title)
                    
                    HStack {
                        
                        if self.comicUserInfo?.profile_image == nil {
                            Image(systemName: "person.crop.circle")
                                .font(.system(size: 75))
                        }
                        
                        VStack(alignment: .leading) {
                            
                            Text(self.comicUserInfo?.screen_name ?? "screen_name ***")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text("@" + String(self.comicUserInfo?.name ?? "name ***"))
                                .font(.footnote)
                                .lineLimit(0)
                            Text(self.comicUserInfo?.email ?? "email ***")
                                .font(.callout)
                            Text(self.comicUserInfo?.id ?? "id ***")
                                .font(.caption)
                                .fontWeight(.light)
                                .foregroundColor(Color.gray)
                            
                        }
                        
                    }
                    
                }
                .onAppear {
                    
                    // self.comic.user_idに値が入ってから実行する
                    Utility().wait( { return self.comic?.user_id == nil } ) {
                        
                        APIRequest().getSpecifiedUser(self.comic?.user_id ?? "") { User in
                            self.comicUserInfo = User.first!
                            print("### 投稿ユーザーデバッグ")
                            print(self.comic?.user_id)
                            print(self.comic?.text)
                            print(self.comicUserInfo?.id)
                            print("###")
                        }
                        
                    }
                    
                }
                
                Group {
                    Text("本文")
                        .font(.title)
                    
                    Text(self.comic?.text ?? "")
                    
                }
                
            }
            
            Group {
                Text("コメント")
                    .font(.largeTitle)
                
                List(comments ?? []) { comment in

                    Text("本文")
                        .font(.title)
                    Text(comment.text)
                    
                    Text("ユーザー")
                        .font(.title)
                    VStack {
                        
                        Text(self.commentUserInfo[comment.id]?.screen_name ?? "screen_name ***")
                        Text(self.commentUserInfo[comment.id]?.name ?? "name ***")
                        Text(self.commentUserInfo[comment.id]?.email ?? "id ***")
                        
                    }
                    .onAppear {
                        
                        APIRequest().getSpecifiedUser(comment.user_id) { User in
                            self.commentUserInfo[comment.id] = User.first!
                            print("### コメントユーザーデバッグ")
                            print(self.commentUserInfo[comment.id]?.screen_name)
                            print(self.commentUserInfo[comment.id]?.id)
                            print("###")

                        }
                        
                    }
                    
                }
                
            }
            
            Group {
                Text("いいね")
                    .font(.largeTitle)
                

                Button(action: {
                    let favoriteData = FavoriteData(comic_id: self.comic?.id ?? "")
                    APIRequest().postFavorite(favoriteData)
                    }
                ) {
                    
                    Text("Favorite / Unfavoriteする")
                    
                }
                
                List(favorites ?? []) { favorite in

                    Text("いいねしたユーザー")
                        .font(.title)
                    
                    VStack {
                        
                        Text(self.favoriteUserInfo[favorite.id]?.screen_name ?? "screen_name ***")
                        Text(self.favoriteUserInfo[favorite.id]?.name ?? "name ***")
                        Text(self.favoriteUserInfo[favorite.id]?.email ?? "id ***")

                        
                    }
                    .onAppear {
                        
                        APIRequest().getSpecifiedUser(favorite.user_id) { User in
                            self.favoriteUserInfo[favorite.id] = User.first!
                            print("### いいねユーザーデバッグ")
                            print(self.favoriteUserInfo[favorite.id])
                            print(self.favoriteUserInfo[favorite.id]?.screen_name)
                            print(self.favoriteUserInfo[favorite.id]?.id)
                            print("###")                        }
                        
                    }
                    
                }
                
            }
            
        }
        .onAppear {
            
            APIRequest().getComicDetail(self.id) { (Data) in
                print("### comicinfo全体デバッグ")
                print(Data)
                self.comic = Data.comic.first!
                self.comments = Data.comments
                self.favorites = Data.favorites
                print(self.favorites)
                print("###")
            }
            
        }
        
    }
    
}

struct ComicInfo_Previews: PreviewProvider {
    static var previews: some View {
        ComicInfo()
    }
}
