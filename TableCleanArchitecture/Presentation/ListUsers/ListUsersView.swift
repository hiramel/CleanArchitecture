//
//  ListUsersView.swift
//  TableCleanArchitecture
//
//  Created by Hiram Elguézabal Jiménez on 24/02/26.
//

import SwiftUI

struct ListUsersView: View {
    
    let viewModel: UsersViewModel
    
    var body: some View {
        
        content
            .navigationTitle("Users")
            .task {
                await viewModel.loadUsers()
            }
    }
        
        @ViewBuilder
        private var content: some View {
            if viewModel.isLoading {
                ProgressView("Loading users...")
            } else {
                List {
                    ForEach(viewModel.users) { user in
                        NavigationLink {
                            UserDetails(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                    }
                    .onDelete(perform: deleteUser)
                }
            }
    }
    
    // 🔥 Método que conecta con el ViewModel async
    private func deleteUser(at offsets: IndexSet) {
        for index in offsets {
            let user = viewModel.users[index]
            
            Task {
                await viewModel.deleteUser(id: user.id)
            }
        }
    }
}
