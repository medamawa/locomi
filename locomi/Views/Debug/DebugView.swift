//
//  DebugView.swift
//  locomi
//
//  Created by sogo on 2020/05/14.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI
import MapKit

struct DebugView: View {
    
    @ObservedObject private var locationManager = LocationManager()
        
    var body: some View {
        
        let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate: CLLocationCoordinate2D()
        
        return VStack {
            
            VStack {
                Text("【アップデート情報 1.0.7】")
                    .font(.headline)
                    .foregroundColor(Color.white)
                VStack(alignment: .leading) {
                    Text("- ボタンを改善")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                    Text(" 大きくしました")
                        .font(.caption)
                        .foregroundColor(Color.white)
                    Text("- 削除機能を導入")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                    Text(" 自分の投稿を削除できるようになりました")
                        .font(.caption)
                        .foregroundColor(Color.white)
                    Text("- ビューの改善")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                    Text(" ビルドし直しました")
                        .font(.caption)
                        .foregroundColor(Color.white)
                }
            }
            .padding(5)
            .background(Color.orange)
            .cornerRadius(10)
            
            UserInformations()
            
            ComicInformations()
            
            Text("(\(coordinate.latitude), \(coordinate.longitude))")
            
        }
        
    }
    
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}
