//
//  MockDeleteUserUseCase.swift
//  TableCleanArchitectureTests
//
//  Created by Hiram Elguézabal Jiménez on 22/05/26.
//

import Foundation

@testable import TableCleanArchitecture


final class MockDeleteUserUseCase: DeleteUserUseCaseProtocol {

    var deleteUserCalled = false
    var deletedUserId: String?

    func execute(userId: String) async throws {

        deleteUserCalled = true
        deletedUserId = userId
    }
}
