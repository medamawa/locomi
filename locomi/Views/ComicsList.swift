//
//  ComicsList.swift
//  locomi
//
//  Created by sogo on 2020/04/27.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct ComicsList: View {
    @State var comics: [Comic] = []
    @State var showingComicDetail = false
    
    var body: some View {
        
        List(comics) { comic in
            
            VStack(alignment: .leading) {

                Text(comic.text)
                Text(comic.user_id)
                Text(String(comic.lat))
                Text(String(comic.lng))
                Button(action: { self.showingComicDetail.toggle() }) {
                    Text("Tap to show detail")
                }.sheet(isPresented: self.$showingComicDetail) {
                    ComicInfo(id: comic.id)
                }
                
            }
            
        }
        .onAppear {
            
            APIRequest().getComics { (comics) in
                self.comics = comics
            }
            
        }
        
    }
}

struct ComicsList_Previews: PreviewProvider {
    static var previews: some View {
        ComicsList()
    }
}
