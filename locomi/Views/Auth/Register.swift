//
//  Register.swift
//  locomi
//
//  Created by sogo on 2020/04/27.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct Register: View {
    
    @State var showText = false
    @State var screen_name = ""
    @State var name = ""
    @State var email = ""
    @State var password = ""
    @State var password_confirmation = ""
    @State var selected = 0
    @State var birthDate = Date()
    @Binding var isShowing: Bool
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("アカウント名入力")) {
                    
                    TextField("アカウント名を入力してください", text: $screen_name)
                    
                }
                
                Section(header: Text("ユーザー名入力")) {
                    
                    TextField("ユーザー名を入力してください", text: $name)
                    
                }
                
                Section(header: Text("メールアドレス入力")) {
                    
                    TextField("メールアドレスを入力してください", text: $email)
                    
                }
                
                Section(header: Text("パスワード入力")) {
                    
                    TextField("パスワードを入力してください", text: $password)
                    TextField("再度パスワードを入力してください", text: $password_confirmation)
                    
                }
                
                Section {
                    
                    Button(action: {
                        let registerData = ResisterData(screen_name: self.screen_name, name: self.name, email: self.email, password: self.password, password_confirmation: self.password_confirmation)
                        APIRequest().postRegister(registerData)
                        // モーダルを閉じる
                        self.isShowing = false
                    }) {
                        
                        Text("アカウントを登録する")
                        
                    }
                    
                }
                
            }.navigationBarTitle("アカウント登録")
            
        }
        
    }
}
