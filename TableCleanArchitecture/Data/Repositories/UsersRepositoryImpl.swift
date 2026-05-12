//
//  UsersRepositoryImpl.swift
//  TableCleanArchitecture
//
//  Created by Hiram Elguézabal Jiménez on 24/02/26.
//

import Foundation

//Repositories
//Implementación concreta del protocolo del dominio

final class UsersRepositoryImpl: UsersRepository {
    
    private let remoteDataSource: RemoteUsersDataSource
    
    init(remoteDataSource: RemoteUsersDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getUsers() async throws -> [User] {
        let dtos = try await remoteDataSource.fetchUsers()
        
        // Convertimos DTO → Entity
        return dtos.map { $0.toDomain() }
    }
    
    func deleteUser(id: String) async throws {
        try await remoteDataSource.deleteUser(id: id)
    }

}
