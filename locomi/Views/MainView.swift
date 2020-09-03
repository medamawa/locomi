//
//  TabView.swift
//  locomi
//
//  Created by sogo on 2020/05/16.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @State var index = 0
    
    init() {
        UITabBar.appearance().isTranslucent = false
    }
    
    var body: some View {
        
        TabView {
            
            MapLine()
                .tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar0)
                        .font(.title)
                    Text("\(Constants.TabBarText.tabBar0)")
                        .font(.title)
                })
                .tag(0)
                .edgesIgnoringSafeArea(.top)
            
            ARMainView()
                .tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar1)
                        .font(.title)
                    Text("\(Constants.TabBarText.tabBar1)")
                        .font(.title)
                })
                .tag(0)
                .edgesIgnoringSafeArea(.top)
            
//            NotificationsView()
//                .tabItem({
//                    Image(systemName: Constants.TabBarImageName.tabBar2)
//                        .font(.title)
//                    Text("\(Constants.TabBarText.tabBar2)")
//                        .font(.title)
//                })
//                .tag(0)
//                .edgesIgnoringSafeArea(.top)
            
            DebugView()
                .tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBarD)
                        .font(.title)
                    Text("\(Constants.TabBarText.tabBarD)")
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
            
        }
        
    }

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
