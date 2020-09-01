//
//  ContentView.swift
//  locomi
//
//  Created by sogo on 2020/04/27.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State var showingLogin = true
    
    var body: some View {
        
        VStack {
            
            if APIRequest().getAuth() {
                MainView()
            } else {
                AuthElements()
            }
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
