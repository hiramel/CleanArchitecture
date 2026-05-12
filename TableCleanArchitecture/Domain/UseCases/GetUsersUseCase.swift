//
//  GetUsersUseCase.swift
//  TableCleanArchitecture
//
//  Created by Hiram Elguézabal Jiménez on 24/02/26.
//

import Foundation


//El UseCase:
//Recibe un repository
//Ejecuta la acción
//Devuelve el resultado

struct GetUsersUseCase: GetUsersUseCaseProtocol {
    
    private let repository: UsersRepository
    
    init(repository: UsersRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [User] {
        try await repository.getUsers()
    }
}
