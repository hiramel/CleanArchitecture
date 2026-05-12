//
//  RemoteUserDataSource.swift
//  TableCleanArchitecture
//
//  Created by Hiram Elguézabal Jiménez on 24/02/26.
//

import Foundation

import Foundation

protocol RemoteUsersDataSource {
    func fetchUsers() async throws -> [UserDTO]
    func deleteUser(id: String) async throws
}
