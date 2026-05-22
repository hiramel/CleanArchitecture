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
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading users...")
                } else {
                    List {
                        ForEach(viewModel.users) { user in
                            
                            NavigationLink(value: user) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(user.name)
                                        .font(.headline)
                                    
                                    Text(user.email)
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                    
                                    Text(user.description)
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                        .onDelete(perform: deleteUser)
                    }
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                UserDetails(user: user)
            }
        }
        .task {
            await viewModel.loadUsers()
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
