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
    
    var body: some View {
        
        ZStack {
            
            MapView(selectedComic: $selectedComic, showingComicDetail: $showingComicDetail, comics: comics)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
//                    if showingComicDetail {
//
//                        if self.selectedComic != nil {
//
//                            RoundedRectangle(cornerRadius: 20, style: .continuous)
//                                .fill(Color.gray)
//                                .frame(width: 200, height: 100)
//
//                        }
//
//                    }
                    
                    Spacer()
                    
                }
                
            }
            
        }
        .sheet(isPresented: $showingComicDetail) {
            
            if self.selectedComic != nil {
                
                ComicDetail(id: (self.selectedComic?.subtitle)!!)
                
            }
            
        }
        .onAppear {
            APIRequest().getComics { (comics) in
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
