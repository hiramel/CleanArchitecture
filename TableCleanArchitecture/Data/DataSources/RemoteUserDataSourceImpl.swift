//
//  RemoteUserDataSourceImpl.swift
//  TableCleanArchitecture
//
//  Created by Hiram Elguézabal Jiménez on 24/02/26.
//
import Foundation

//DataSources
//Cómo obtenemos los datos (API, Local, etc.)

final class RemoteUserDataSourceImpl: RemoteUsersDataSource {

    private let baseURL = "https://699614197d178643657378c9.mockapi.io/api/he/PerfilUsuario"
    
    func fetchUsers() async throws -> [UserDTO] {
        guard let url = URL(string: baseURL) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode([UserDTO].self, from: data)
    }
    
    func deleteUser(id: String) async throws {
        
        guard let url = URL(string: "\(baseURL)/\(id)") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
    }
}
