//
//  UserList.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 08.12.23.
//

import SwiftUI

struct UserList: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \SwiftDataUser.firstName, order: .forward, animation: .smooth) var users: [SwiftDataUser]
    
    var body: some View {
        VStack {
            if users.isEmpty {
               Text("Press '+' to add new user")
            } else {
                List(users) { user in
                    NavigationLink {
                        EditUser(user: user)
                    } label: {
                        VStack(alignment: .leading) {
                            Text("\(user.firstName) \(user.lastName)")
                                .fontWeight(.bold)
                                .font(.headline)
                            Text("Company: \(user.company.companyName)")
                                .fontWeight(.regular)
                                .font(.caption)
                            Text("Designation: \(user.company.designation)")
                                .fontWeight(.regular)
                                .font(.caption2)
                        }
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(user)
                            }
                        }
                    }
                }
            }
        }
        .toolbar {
            NavigationLink {
                CreateUser()
            } label: {
                Text("+")
                    .fontWeight(.bold)
                    .font(.title)
            }
        }
    }
}
