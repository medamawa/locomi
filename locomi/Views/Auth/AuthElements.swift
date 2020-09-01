//
//  AuthElements.swift
//  locomi
//
//  Created by sogo on 2020/09/02.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct AuthElements: View {
    
    @State private var showingRegister = false
    @State private var showingLogin = false
    
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
            
        }
        
    }
    
}

struct AuthElements_Previews: PreviewProvider {
    static var previews: some View {
        AuthElements()
    }
}
