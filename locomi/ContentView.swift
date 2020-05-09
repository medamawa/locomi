//
//  ContentView.swift
//  locomi
//
//  Created by sogo on 2020/04/27.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var locationManager = LocationManager()
    @State private var comics: [Comic] = []
    @State private var showingRegister = false
    @State private var showingLogin = false
    @State private var showingFollow = false
    @State private var showingFollows = false
    @State private var showingFollowers = false
    @State private var showingUsersList = false
    @State private var showingSpecifiedUser = false
    @State private var showingComicsList = false
    @State private var showingMapView = false
    @State private var showingPost = false
    
    var body: some View {
        
        VStack {
            
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
            
            Button(action: { self.showingUsersList.toggle() }) {
                Text("usersList")
            }.sheet(isPresented: $showingUsersList) {
                UsersList()
            }
            
            Button(action: { self.showingFollow.toggle() }) {
                Text("follow/unfollow")
            }.sheet(isPresented: $showingFollow) {
                Follow()
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
            
            Button(action: { self.showingSpecifiedUser.toggle() }) {
                Text("getSpecifiedUserInfo")
            }.sheet(isPresented: $showingSpecifiedUser) {
                SpecifiedUser()
            }
            
            Button(action: { self.showingComicsList.toggle() }) {
                Text("comicsList")
            }.sheet(isPresented: $showingComicsList) {
                ComicsList()
            }
            
            Button(action: { self.showingMapView.toggle() }) {
                Text("mapView")
            }.sheet(isPresented: $showingMapView) {
                MapView(comics: self.comics)
                    .edgesIgnoringSafeArea(.all)
            }
            .onAppear {
                APIRequest().getComics { (comics) in
                    self.comics = comics
                }
            }
            
            Button(action: { self.showingPost.toggle() }) {
                Text("post")
            }.sheet(isPresented: $showingPost) {
                Post()
            }
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
