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
    
    @State private var showingRegister = false
    @State private var showingLogin = false
    @State private var showingLogout = false
    @State private var showingFollows = false
    @State private var showingFollowers = false
    @State private var showingUsers = false
    @State private var showingComicsList = false
    @State private var showingNearComicsList = false
    @State private var showingPost = false
    
    @ObservedObject private var locationManager = LocationManager()
        
    var body: some View {
        
        let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate: CLLocationCoordinate2D()
        
        return VStack {
            
            Button(action: { self.showingRegister.toggle() }) {
                Text("register")
            }.sheet(isPresented: $showingRegister) {
                Register()
            }
            
            Button(action: { self.showingLogin.toggle() }) {
                Text("login")
            }.sheet(isPresented: $showingLogin) {
                Login()
            }
            
            Button(action: { self.showingLogout.toggle() }) {
                Text("logout")
            }.sheet(isPresented: $showingLogout) {
                Logout()
            }
            
            Button(action: { self.showingUsers.toggle() }) {
                Text("users")
            }.sheet(isPresented: $showingUsers) {
                Users()
            }
            
            Button(action: { self.showingFollows.toggle() }) {
                Text("follows")
            }.sheet(isPresented: $showingFollows) {
                Follows()
            }
            
            Button(action: { self.showingFollowers.toggle() }) {
                Text("followers")
            }.sheet(isPresented: $showingFollowers) {
                Followers()
            }
            
            Button(action: { self.showingComicsList.toggle() }) {
                Text("comicsList")
            }.sheet(isPresented: $showingComicsList) {
                ComicsList()
            }
            
            Button(action: { self.showingNearComicsList.toggle() }) {
                Text("nearComicsList")
            }.sheet(isPresented: $showingNearComicsList) {
                NearComicsList()
            }
            
            Button(action: { self.showingPost.toggle() }) {
                Text("post")
            }.sheet(isPresented: $showingPost) {
                Post()
            }
            
            Text("(\(coordinate.latitude), \(coordinate.longitude))")
            
        }
        
    }
    
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}
