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
    
    @State var index = 0
    
    var body: some View {
        
        TabView {
            
            DebugView()
                .tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBarD)
                        .font(.title)
                    Text("\(Constants.TabBarText.tabBarD)")
                        .font(.title)
                })
                .tag(0)
                .edgesIgnoringSafeArea(.top)
            
            MapLine()
                .tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar0)
                        .font(.title)
                    Text("\(Constants.TabBarText.tabBar0)")
                        .font(.title)
                })
                .tag(0)
                .edgesIgnoringSafeArea(.top)
            
            ARView()
                .tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar1)
                        .font(.title)
                    Text("\(Constants.TabBarText.tabBar1)")
                        .font(.title)
                })
                .tag(0)
                .edgesIgnoringSafeArea(.top)
            
            NotificationsView()
                .tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar2)
                        .font(.title)
                    Text("\(Constants.TabBarText.tabBar2)")
                        .font(.title)
                })
                .tag(0)
                .edgesIgnoringSafeArea(.top)
            
            UserView()
                .tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar3)
                        .font(.title)
                    Text("\(Constants.TabBarText.tabBar3)")
                        .font(.title)
                })
                .tag(0)
                .edgesIgnoringSafeArea(.top)
            
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
