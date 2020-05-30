//
//  ARView.swift
//  locomi
//
//  Created by sogo on 2020/05/14.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct ARMainView: View {
    
    var body: some View {
        
        return ARViewContainer()
            .edgesIgnoringSafeArea(.all)
        
    }
    
}

struct ARMainView_Previews: PreviewProvider {
    static var previews: some View {
        ARMainView()
    }
}
