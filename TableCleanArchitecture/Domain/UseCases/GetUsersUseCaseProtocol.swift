//
//  GetUsersUseCaseProtocol.swift
//  TableCleanArchitecture
//
//  Created by Hiram Elguézabal Jiménez on 25/02/26.
//

import Foundation

protocol GetUsersUseCaseProtocol {
    func execute() async throws -> [User]
}
