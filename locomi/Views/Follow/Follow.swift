//
//  Follow.swift
//  locomi
//
//  Created by sogo on 2020/05/01.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct Follow: View {
    
    @State var showText = false
    @State var id = ""
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("ID入力")) {
                    
                    TextField("IDを入力してください", text: $id)
                    
                }
                
                Section {
                    
                    Button(action: {
                        APIRequest().postFollow(self.id)
                        }
                    ) {
                        
                        Text("Follow / Unfollowする")
                        
                    }
                    
                }
                
            }
            .navigationBarTitle("Follow / Unfollow")
            
        }
        
    }
    
}

struct Follow_Previews: PreviewProvider {
    static var previews: some View {
        Follow()
    }
}
