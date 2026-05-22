//
//  MainTabView.swift
//  TableCleanArchitecture
//
//  Created by Hiram Elguézabal Jiménez on 22/05/26.
//

import SwiftUI

struct MainTabView: View {
    
    var viewModel: UsersViewModel
    
    var body: some View {
        TabView{
            NavigationStack{
                ListUsersView(viewModel: viewModel)
            }
            .tabItem {
                Label("Users", systemImage: "person.3")
            }
            Text("Home Comming soon")
                .tabItem {
                 Label("Home", systemImage: "house")
                }
            Text("Settings")
                .tabItem {
                    Label("Settings Comming soon", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    //MainTabView()
}
