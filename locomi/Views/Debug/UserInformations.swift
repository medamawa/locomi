//
//  UserInformations.swift
//  locomi
//
//  Created by sogo on 2020/08/30.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct UserInformations: View {
    
    @State private var showingRegister = false
    @State private var showingLogin = false
    @State private var showingLogout = false
    @State private var showingFollows = false
    @State private var showingFollowers = false
    @State private var showingUsers = false
    
    var body: some View {
        
        VStack {
            
            Button(action: { self.showingRegister.toggle() }) {
                Text("register")
                    .foregroundColor(Color.white)
                    .padding(3)
                    .background(Color.blue)
                    .cornerRadius(5)
            }.sheet(isPresented: $showingRegister) {
                Register(isShowing: self.$showingRegister)
            }
            
            Button(action: { self.showingLogin.toggle() }) {
                Text("login")
                    .foregroundColor(Color.white)
                    .padding(3)
                    .background(Color.blue)
                    .cornerRadius(5)
            }.sheet(isPresented: $showingLogin) {
                Login(isShowing: self.$showingLogin)
            }
            
            Button(action: { self.showingLogout.toggle() }) {
                Text("logout")
                    .foregroundColor(Color.white)
                    .padding(3)
                    .background(Color.blue)
                    .cornerRadius(5)
            }.sheet(isPresented: $showingLogout) {
                Logout(isShowing: self.$showingLogout)
            }
            
            Button(action: { self.showingUsers.toggle() }) {
                Text("users")
                    .foregroundColor(Color.white)
                    .padding(3)
                    .background(Color.blue)
                    .cornerRadius(5)
            }.sheet(isPresented: $showingUsers) {
                Users()
            }
            
            Button(action: { self.showingFollows.toggle() }) {
                Text("follows")
                    .foregroundColor(Color.white)
                    .padding(3)
                    .background(Color.blue)
                    .cornerRadius(5)
            }.sheet(isPresented: $showingFollows) {
                Follows()
            }
            
            Button(action: { self.showingFollowers.toggle() }) {
                Text("followers")
                    .foregroundColor(Color.white)
                    .padding(3)
                    .background(Color.blue)
                    .cornerRadius(5)
            }.sheet(isPresented: $showingFollowers) {
                Followers()
            }
            
        }
        
    }
    
}
