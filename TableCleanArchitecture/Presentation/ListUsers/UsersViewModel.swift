//
//  UsersViewModel.swift
//  TableCleanArchitecture
//
//  Created by Hiram Elguézabal Jiménez on 24/02/26.
//

import Foundation
import Observation

@Observable
@MainActor
final class UsersViewModel {

    var users: [User] = []
    var isLoading = false
    
    private let getUsersUseCase: GetUsersUseCaseProtocol
    private let deleteUserUseCase: DeleteUserUseCaseProtocol

    init(
        getUsersUseCase: GetUsersUseCaseProtocol,
        deleteUserUseCase: DeleteUserUseCaseProtocol
    ) {
        self.getUsersUseCase = getUsersUseCase
        self.deleteUserUseCase = deleteUserUseCase
    }
    
    func loadUsers() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            users = try await getUsersUseCase.execute()
        } catch {
            print(error)
        }
    }
    
    func deleteUser(id: String) async {
        do {
            try await deleteUserUseCase.execute(userId: id)
            users.removeAll { $0.id == id }
        } catch {
            print(error)
        }
    }
    
}
