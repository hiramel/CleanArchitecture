//
//  UserRowView.swift
//  TableCleanArchitecture
//
//  Created by Hiram Elguézabal Jiménez on 22/05/26.
//

import SwiftUI

struct UserRowView: View {
    
    var user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(user.name)
                .font(.headline)
            
            Text(user.email)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Text(user.description)
                .font(.caption)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    UserRowView(user: User(id: "1", name: "Hiram", email: "hirame@gmail.com", description: "this is a row test"))
}
