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

                        ComicDetail(id: (self.selectedComic?.subtitle)!!, isShowing: self.$showingComicDetail)

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
                            .font(Font.largeTitle.weight(.bold))
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding(.trailing)
                    .padding(.bottom)
                    .sheet(isPresented: $showingPost) {
                        Post(isShowing: self.$showingPost)
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
