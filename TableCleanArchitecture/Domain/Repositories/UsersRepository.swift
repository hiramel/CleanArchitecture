//
//  UsersRepository.swift
//  TableCleanArchitecture
//
//  Created by Hiram Elguézabal Jiménez on 24/02/26.
//

import Foundation

protocol UsersRepository {
    func getUsers() async throws -> [User]
    func deleteUser(id: String) async throws

}
