//
//  TableCleanArchitectureApp.swift
//  TableCleanArchitecture
//
//  Created by Hiram Elguézabal Jiménez on 24/02/26.
//

import SwiftUI

@main
struct TableCleanArchitectureApp: App {
    
    var body: some Scene {
        WindowGroup {
            
            let dataSource = RemoteUserDataSourceImpl()
            let repository = UsersRepositoryImpl(remoteDataSource: dataSource)
            
            let getUsersUseCase = GetUsersUseCase(repository: repository)
            let deleteUserUseCase = DeleteUserUseCase(repository: repository)
            
            let viewModel = UsersViewModel(
                getUsersUseCase: getUsersUseCase,
                deleteUserUseCase: deleteUserUseCase
            )
            
            MainTabView(viewModel: viewModel)
        }
    }
}
