//
//  DeleteUserUseCaseProtocol.swift
//  TableCleanArchitecture
//
//  Created by Hiram Elguézabal Jiménez on 25/02/26.
//

import Foundation

protocol DeleteUserUseCaseProtocol {
    func execute(userId: String) async throws
}
