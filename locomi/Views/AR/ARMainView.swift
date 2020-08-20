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
        
        VStack {
            
            Text("locomi Lens")
                .font(.largeTitle)
            Image(systemName: "camera.viewfinder")
                .font(.largeTitle)
            
        }
        .onAppear{
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
        }
        .onTapGesture {
            let url = URL(string: "locomi://")!
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
        }
        
    }
    
}

struct ARMainView_Previews: PreviewProvider {
    static var previews: some View {
        ARMainView()
    }
}
