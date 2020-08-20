//
//  FavoriteViewModel.swift
//  locomi
//
//  Created by sogo on 2020/08/13.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import Foundation

class FavoriteViewModel: ObservableObject {
    
    let request = APIRequest()
    @Published var isFavorite: Bool = false
    
    func get(data: FavoriteData) {
        self.isFavorite = self.request.postIsFavorite(data)
    }
}
