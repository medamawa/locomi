//
//  NearComicsList.swift
//  locomi
//
//  Created by sogo on 2020/08/21.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI
import MapKit

struct NearComicsList: View {
    
    @State var comics: [Comic] = []
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
        
        let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate: CLLocationCoordinate2D()
        
        return NavigationView {
            
            Form {
                
                Section(header: Text("位置情報入力")) {
                    
                    Text("緯度：\(coordinate.latitude)")
                    Text("経度：\(coordinate.longitude)")
                    
                }
                
                Section(header: Text("近くの投稿")) {
                    
                    List(comics) { comic in
                        
                        ComicInfo(comic: comic)
                        
                    }
                    
                }
                
                Section {
                    
                    Button(action: {
                        APIRequest().getNearComics(latitude: String(coordinate.latitude), longitude: String(coordinate.longitude)) { comics in
                            self.comics = comics
                        }
                    }) {
                        
                        Text("取得する")
                        
                    }
                    
                }
                
            }.navigationBarTitle("近くの投稿")
            
        }
        
    }
    
}

struct NearComicsList_Previews: PreviewProvider {
    static var previews: some View {
        NearComicsList()
    }
}
