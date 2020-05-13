//
//  ComicDetail.swift
//  locomi
//
//  Created by sogo on 2020/05/12.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI
import MapKit

struct ComicDetail: View {
    
    @State private var selectedComic: MKAnnotation?
    @State private var showingComicDetail: Bool
        
    var body: some View {
        
        VStack {
            
            Text("comicDetail")
                .font(.title)
            Text(String((selectedComic?.title ?? "") ?? ""))
            Text(String((selectedComic?.subtitle ?? "") ?? ""))
            
        }
        
    }
    
}
