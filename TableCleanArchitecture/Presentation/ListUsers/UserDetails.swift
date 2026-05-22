//
//  UserDetails.swift
//  TableCleanArchitecture
//
//  Created by Hiram Elguézabal Jiménez on 22/05/26.
//

import SwiftUI

struct UserDetails: View {
    
    let user: User
    
    var body: some View {
        ScrollView{
            VStack(spacing: 24) {
                VStack(spacing: 12) {
                    Circle()
                        .fill(Color.blue.gradient)
                        .frame(width: 100, height: 100)
                        .overlay {
                            Text(user.name.prefix(2).uppercased())
                                .font(.system(size: 36, weight: .bold))
                                .foregroundStyle(.white)
                        }
                        .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y:4)
                    Text(user.name)
                        .font(.title2)
                        .bold()
                }
                .padding(.top)
                
                VStack(alignment: .leading, spacing: 16){
                    HStack(alignment: .top, spacing: 12){
                        Image(systemName: "envelope.fill")
                            .foregroundStyle(.blue)
                            .frame(width: 24)
                        VStack(alignment: .leading, spacing: 2){
                            Text("Email")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Text(user.email)
                                .font(.body)
                        }
                    }
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Label("Biografia", systemImage: "person.text.rectangle.fill")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        Text(user.description)
                            .font(.body)
                            .foregroundStyle(.primary)
                            .lineLimit(nil)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
                .padding(.horizontal)
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UserDetails(user: User(id: "1", name: "Hiram", email: "hiramel@gmail.com", description: "description"))
}
