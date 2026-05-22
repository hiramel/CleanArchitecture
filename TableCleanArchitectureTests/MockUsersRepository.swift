//
//  MockUsersRepository.swift
//  TableCleanArchitectureTests
//
//  Created by Hiram Elguézabal Jiménez on 22/05/26.
//

import Foundation
@testable import TableCleanArchitecture

final class MockUsersRepository: UsersRepository {

    // MARK: - Tracking

    var deleteUserCalled = false
    var deletedUserId: String?

    // MARK: - Mock Data

    var usersToReturn: [User] = []

    // MARK: - Functions

    func getUsers() async throws -> [User] {
        usersToReturn
    }

    func deleteUser(id: String) async throws {
        deleteUserCalled = true
        deletedUserId = id
    }
}
