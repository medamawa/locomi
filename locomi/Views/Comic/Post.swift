//
//  PostComic.swift
//  locomi
//
//  Created by sogo on 2020/04/27.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI
import MapKit

struct Post: View {
    
    @ObservedObject private var locationManager = LocationManager()
    @State var showText = false
    @State var altitudeCorrection: Double = 0
    @State var text = ""
    @State var release = "0"
    @State var selected = 0
    @State var birthDate = Date()
    @Binding var isShowing: Bool
    @State private var loginIsShowing: Bool = false
    
    var body: some View {
        
        let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate: CLLocationCoordinate2D()
        let altitude = self.locationManager.location?.altitude ?? 0.0
        
        return NavigationView {
            
            Form {
                
                if APIRequest().getAuth() {
                    Text("ログイン済みです")
                    
                    Section(header: Text("位置情報、標高")) {
                        
                        Text("緯度：\(coordinate.latitude)")
                        Text("経度：\(coordinate.longitude)")
                        Text("標高：\(altitude + altitudeCorrection)m")
//                        標高を調整できる（デバッグ用）
//                        Slider(value: $altitudeCorrection, in: -10 ... 20, minimumValueLabel: Text("-10"), maximumValueLabel: Text("20"), label: { EmptyView() })
                        
                    }
                    
                    Section(header: Text("本文を入力")) {
                        
                        TextField("投稿の本文を入力してください", text: $text)
                        
                    }
                    
                    //                サーバー側で公開範囲が未実装なので、0で固定しておく
                    //                Section(header: Text("公開範囲を入力")) {
                    //
                    //                    TextField("公開範囲を入力して下さい（０を入力してください）", text: $release)
                    //
                    //                }
                    
                    Section {
                        
                        Button(action: {
//                            altitudeはnilの場合はnilで渡すように条件分岐を行っている
//                            標高を調整できる（デバッグ用）
//                            let postData = PostData(lat: String(coordinate.latitude), lng: String(coordinate.longitude), altitude: self.locationManager.location?.altitude != nil ? altitude + altitudeCorrection : nil, text: self.text, release: self.release)
                            let postData = PostData(lat: String(coordinate.latitude), lng: String(coordinate.longitude), altitude: self.locationManager.location?.altitude, text: self.text, release: self.release)
                            APIRequest().post(postData)
                            // モーダルを閉じる
                            self.isShowing = false
                        }) {
                            
                            Text("投稿する")
                            
                        }
                        
                    }
                    
                } else {
                    Text("ログインしていません")
                    
                    Section {
                        Button(action: { self.loginIsShowing.toggle() }) {
                            Text("ログインする")
                                .sheet(isPresented: $loginIsShowing) {
                                    Login(isShowing: self.$loginIsShowing)
                                }
                        }
                    }
                }
                
            }.navigationBarTitle("投稿の作成")
            
        }
        
    }
    
}

struct Post_Previews: PreviewProvider {
    static var previews: some View {
        Post(isShowing: .constant(true))
    }
}
