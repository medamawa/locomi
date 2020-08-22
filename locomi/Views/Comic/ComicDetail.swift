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
    
    var body: some View {
        
        VStack {
            
            ComicInfo(id: self.id)
            
            VStack {
                
                Text("コメント")
                    .font(.title)
                
                List(comments ?? []) { comment in

                    CommentInfo(comment: comment)
                    
                }
                
                Button(action: { self.showingCommentView.toggle() }) {
                    Text("コメントする")
                }.sheet(isPresented: $showingCommentView) {
                    CommentView(comic_id: self.comic?.id ?? "", isShowing: $showingCommentView)
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

struct ComicDetail_Previews: PreviewProvider {
    static var previews: some View {
        ComicDetail()
    }
}
