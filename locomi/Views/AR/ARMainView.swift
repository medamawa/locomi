//
//  ARView.swift
//  locomi
//
//  Created by sogo on 2020/05/14.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct ARMainView: View {
    
    @State private var transitionToLocomiLens = false
    
    var body: some View {
        
        Button(action: {
            let url = URL(string: "locomiLens://")!
            if UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: {
                        (success) in
                        print("Open \(success)")
                    })
                }else{
                    UIApplication.shared.openURL(url)
                }
            }
        }) {
            HStack {
                Image(systemName: "camera.viewfinder")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                Text("locomi Lens")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                Image(systemName: "arrowshape.turn.up.right")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
            }
            .padding(.all)
            .background(Color.blue)
            .cornerRadius(10)
        }
        
    }
    
}

struct ARMainView_Previews: PreviewProvider {
    static var previews: some View {
        ARMainView()
    }
}
