//
//  SpecifiedUser.swift
//  locomi
//
//  Created by sogo on 2020/04/28.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct SpecifiedUser: View {
    
    @State var showText = false
    @State var id = ""
    @State var screen_name = ""
    @State var name = ""
    @State var email = ""
    @State var selected = 0
    @State var birthDate = Date()
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("ID入力")) {
                    
                    TextField("IDを入力してください", text: $id)
                    
                }
                
                Section {
                    
                    Button(action: {
                        APIRequest().getSpecifiedUser(self.id) { User in
                            self.id = User[0].id
                            self.screen_name = User[0].screen_name
                            self.name = User[0].name
                            self.email = User[0].email
                        }
                    }) {
                        
                        Text("情報をリクエストする")
                        
                    }
                    
                }
                
                Section {
                    
                    Text(self.id)
                    Text(self.screen_name)
                    Text(self.name)
                    Text(self.email)
                    
                }
                
            }
            .navigationBarTitle("特定のユーザー情報を取得")
            
        }
        
    }
    
}

struct SpecifiedUser_Previews: PreviewProvider {
    static var previews: some View {
        SpecifiedUser()
    }
}
