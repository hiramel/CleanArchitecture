//
//  UserDTO.swift
//  TableCleanArchitecture
//
//  Created by Hiram Elguézabal Jiménez on 24/02/26.
//

import Foundation

//DTOs
//Modelos que vienen del backend

struct UserDTO: Codable {
    let id: String
    let name: String
    let email: String
    let description: String
}
