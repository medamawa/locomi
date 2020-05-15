//
//  SpecifiedUserComicsList.swift
//  locomi
//
//  Created by sogo on 2020/05/15.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct SpecifiedUserComicsList: View {
    
    @State var user_id = ""
    @State var comics: [Comic] = []
    
    var body: some View {
        
        List(comics) { comic in
            
            ComicInfo(comic: comic)
            
        }
        .onAppear {
            
            APIRequest().getSpecifiedUserComics(self.user_id) { comics in
                self.comics = comics
            }
        }
        
    }
    
}

struct SpecifiedUserComicsList_Previews: PreviewProvider {
    static var previews: some View {
        SpecifiedUserComicsList()
    }
}
