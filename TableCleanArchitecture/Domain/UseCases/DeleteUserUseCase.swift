//
//  DeleteUserUseCase.swift
//  TableCleanArchitecture
//
//  Created by Hiram Elguézabal Jiménez on 25/02/26.
//

import Foundation

struct DeleteUserUseCase: DeleteUserUseCaseProtocol {
    
    private let repository: UsersRepository
    
    init(repository: UsersRepository) {
        self.repository = repository
    }
    
    func execute(userId: String) async throws {
        try await repository.deleteUser(id: userId)
    }
}
