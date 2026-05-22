//
//  MockUsersRemoteDataSource.swift
//  TableCleanArchitectureTests
//
//  Created by Hiram Elguézabal Jiménez on 22/05/26.
//

import Foundation
@testable import TableCleanArchitecture

final class MockUsersRemoteDataSource: RemoteUsersDataSource {
    
    var deleteUserCalled = false
    var deletedUserId: String?
    
    func deleteUser(id: String) async throws {
        deleteUserCalled = true
        deletedUserId = id
    }

    var dtosToReturn: [UserDTO] = []
    func fetchUsers() async throws -> [UserDTO] {
        dtosToReturn
    }
}
