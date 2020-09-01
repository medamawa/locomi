//
//  DeleteComic.swift
//  locomi
//
//  Created by sogo on 2020/08/26.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct DeleteComic: View {
    
    @State var comic_id = ""
    @Binding var isShowing: Bool
    
    var body: some View {
        
        return NavigationView {
            
            Form {
                
                Section(header: Text("投稿ID")) {
                    
                    TextField("消去する投稿IDを入力してください", text: $comic_id)
                    
                }
                
                
                
                Section {
                    
                    Button(action: {
                        APIRequest().deleteComic(self.comic_id)
                        // モーダルを閉じる
                        self.isShowing = false
                    }) {
                        
                        Text("消去する")
                        
                    }
                    
                }
                
            }.navigationBarTitle("投稿の消去")
            
        }
        
    }
    
}
