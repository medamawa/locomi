//
//  PostComic.swift
//  locomi
//
//  Created by sogo on 2020/04/27.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct Post: View {
    
    @State var showText = false
    @State var latString = ""
    @State var lngString = ""
    @State var text = ""
    @State var release = ""
    @State var selected = 0
    @State var birthDate = Date()
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("位置情報入力")) {
                    
                    TextField("緯度（lattitude）を入力してください", text: $latString)
                    TextField("経度（longitude）を入力してください", text: $lngString)
                    
                }
                
                Section(header: Text("本文を入力")) {
                    
                    TextField("投稿の本文を入力してください", text: $text)
                    
                }
                
                Section(header: Text("公開範囲を入力")) {
                    
                    TextField("公開範囲を入力して下さい（０を入力してください）", text: $release)
                    
                }
                
                Section {
                    
                    Button(action: {
                        let postData = PostData(lat: self.latString, lng: self.lngString, text: self.text, release: self.release)
                        APIRequest().post(postData)
                    }) {
                        
                        Text("投稿する")
                        
                    }
                    
                }
                
            }.navigationBarTitle("投稿の作成")
            
        }
        
    }
    
}

struct Post_Previews: PreviewProvider {
    static var previews: some View {
        Post()
    }
}
