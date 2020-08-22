//
//  CommentView.swift
//  locomi
//
//  Created by sogo on 2020/05/10.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct CommentView: View {
    
    @State var comic_id: String
    @State var text = ""
    @State var release = ""
    @Binding var isShowing: Bool
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("本文を入力")) {
                    
                    TextField("コメントの本文を入力してください", text: $text)
                    
                }
                
                Section {
                    
                    Button(action: {
                        let commentData = CommentData(comic_id: self.comic_id, text: self.text)
                        APIRequest().postComment(commentData)
                        // モーダルを閉じる
                        self.isShowing = false
                    }) {
                        
                        Text("コメントする")
                        
                    }
                    
                }
                
            }.navigationBarTitle("コメントの作成")
            
        }
        
    }
    
}
