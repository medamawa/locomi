//
//  ComicInfo.swift
//  locomi
//
//  Created by sogo on 2020/05/01.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct ComicDetail: View {
    
    @State var id = ""
    @State var comic: Comic?
    @State var comments: [Comment]?
    @State var showingCommentView = false
    @State var showingDeleteAlert = false
    @Binding var isShowing: Bool
    
    var body: some View {
        
        VStack {
            
            ComicInfo(id: self.id)
            
            VStack {
                
                Text("コメント")
                    .font(.title)
                
                List(comments ?? []) { comment in

                    CommentInfo(comment: comment)
                    
                }
                
                if comic?.user_id == UserID().getID() {
                    Button(action: { self.showingDeleteAlert.toggle() }) {
                        Text("削除する")
                            .foregroundColor(Color.white)
                            .padding(5)
                            .background(Color.blue)
                            .cornerRadius(7)
                    }.alert(isPresented: $showingDeleteAlert) {
                        Alert(
                            title: Text("投稿を削除"),
                            message: Text("本当にこの投稿を消去してよろしいですか？"),
                            primaryButton: .destructive(Text("削除")) {
                                APIRequest().deleteComic(self.id)
                                // モーダルを閉じる
                                self.isShowing = false
                            },
                            secondaryButton: .cancel(Text("キャンセル"))
                        )
                    }
                }
                
                Button(action: { self.showingCommentView.toggle() }) {
                    Text("コメントする")
                        .foregroundColor(Color.white)
                        .padding(5)
                        .background(Color.blue)
                        .cornerRadius(7)
                }.sheet(isPresented: $showingCommentView) {
                    CommentView(comic_id: self.comic?.id ?? "", isShowing: self.$showingCommentView)
                }
                
            }
            
        }
        .onAppear {
            
            APIRequest().getComicDetail(self.id) { Data in
                self.comic = Data.comic.first!
                self.comments = Data.comments
            }
            
        }
        
    }
    
}
