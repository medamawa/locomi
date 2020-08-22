//
//  MapLine.swift
//  locomi
//
//  Created by sogo on 2020/05/14.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI
import MapKit

struct MapLine: View {
    
    @State private var comics: [Comic] = []
    @State private var selectedComic: MKAnnotation?
    @State private var showingComicDetail = false
    @State private var showingPost = false
    
    var body: some View {
        
        ZStack {
            
            MapView(selectedComic: $selectedComic, showingComicDetail: $showingComicDetail, comics: comics)
                .edgesIgnoringSafeArea(.all)
                .sheet(isPresented: $showingComicDetail) {

                    if self.selectedComic != nil {

                        ComicDetail(id: (self.selectedComic?.subtitle)!!)

                    }

                }
            
            VStack {
                
                Spacer()
                
                HStack {
                    
                    Spacer()

                    Button(action: {
                        self.showingPost.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                    .sheet(isPresented: $showingPost) {

                        Post(isShowing: $showingPost)

                    }
                    
                }
                
            }
            
        }
        .onAppear {
            
            APIRequest().getComics { comics in
                self.comics = comics
            }
            
        }
        
    }
}

struct MapLine_Previews: PreviewProvider {
    static var previews: some View {
        MapLine()
    }
}
