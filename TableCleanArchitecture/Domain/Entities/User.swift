//
//  User.swift
//  TableCleanArchitecture
//
//  Created by Hiram Elguézabal Jiménez on 24/02/26.
//

import Foundation


//🔹 No es Codable
//Porque el Domain no sabe nada de JSON.
//🔹 No sabe nada de API
//No importa si viene de red o base de datos.
//🔹 Equatable
//Para poder testear fácilmente.
//🔹 Identifiable
//Porque SwiftUI lo necesita.

struct User: Identifiable, Equatable {
    let id: String
    let name: String
    let email: String
    let description: String
}
