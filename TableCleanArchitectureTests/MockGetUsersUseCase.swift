//
//  MockGetUsersUseCase.swift
//  TableCleanArchitectureTests
//
//  Created by Hiram Elguézabal Jiménez on 22/05/26.
//

import Foundation
@testable import TableCleanArchitecture

final class MockGetUsersUseCase: GetUsersUseCaseProtocol {

    var usersToReturn: [User] = []
    func execute() async throws -> [User] {
        usersToReturn
    }
}
