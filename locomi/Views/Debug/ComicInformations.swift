//
//  comicInformations.swift
//  locomi
//
//  Created by sogo on 2020/08/26.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct ComicInformations: View {
    
    @State private var showingComicsList = false
    @State private var showingNearComicsList = false
    @State private var showingPost = false
    
    var body: some View {
        
        VStack {
            
            Button(action: { self.showingComicsList.toggle() }) {
                Text("comicsList")
                    .foregroundColor(Color.white)
                    .padding(3)
                    .background(Color.blue)
                    .cornerRadius(5)
            }.sheet(isPresented: $showingComicsList) {
                ComicsList()
            }
            
            Button(action: { self.showingNearComicsList.toggle() }) {
                Text("nearComicsList")
                    .foregroundColor(Color.white)
                    .padding(3)
                    .background(Color.blue)
                    .cornerRadius(5)
            }.sheet(isPresented: $showingNearComicsList) {
                NearComicsList()
            }
            
            Button(action: { self.showingPost.toggle() }) {
                Text("post")
                    .foregroundColor(Color.white)
                    .padding(3)
                    .background(Color.blue)
                    .cornerRadius(5)
            }.sheet(isPresented: $showingPost) {
                Post(isShowing: self.$showingPost)
            }
            
        }
        
    }
    
}
