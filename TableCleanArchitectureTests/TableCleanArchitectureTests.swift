//
//  TableCleanArchitectureTests.swift
//  TableCleanArchitectureTests
//
//  Created by Hiram Elguézabal Jiménez on 24/02/26.
//

import XCTest
@testable import TableCleanArchitecture

final class TableCleanArchitectureTests: XCTestCase {
    @MainActor
    func test_getUsers_returnsUsersSuccessfully() async throws {

        // Arrange
        let mockRepository = MockUsersRepository()

        mockRepository.usersToReturn = [
            User(id: "1", name: "Hiram", email: "hiram@gmail.com", description: "description")
        ]

        let useCase = GetUsersUseCase(repository: mockRepository)

        // Act
        let users = try await useCase.execute()

        // Assert
        XCTAssertEqual(users.count, 1)
        XCTAssertEqual(users.first?.name, "Hiram")
    }
    @MainActor
    func test_viewModel_loadUsers_updatesUsers() async throws {

        // Arrange
        let mockUseCase = MockGetUsersUseCase()

        mockUseCase.usersToReturn = [
            User(id: "1", name: "Hiram", email: "hiram@gmail.com", description: "description")
        ]
        let mockDeleteUserUseCase = MockDeleteUserUseCase()

        let viewModel = UsersViewModel(getUsersUseCase: mockUseCase, deleteUserUseCase: mockDeleteUserUseCase)

        // Act
        await viewModel.loadUsers()

        // Assert
        XCTAssertEqual(viewModel.users.count, 1)
        XCTAssertEqual(viewModel.users.first?.name, "Hiram")
    }
   
    @MainActor
    func test_repository_mapsDTOsCorrectly() async throws {

        // Arrange
        let mockDataSource = MockUsersRemoteDataSource()

        mockDataSource.dtosToReturn = [
            UserDTO(id: "1", name: "Hiram", email: "hiram@gmail.com", description: "description")
        ]

        let repository = UsersRepositoryImpl(
            remoteDataSource: mockDataSource
        )

        // Act
        let users = try await repository.getUsers()

        // Assert
        XCTAssertEqual(users.first?.name, "Hiram")
    }

}
