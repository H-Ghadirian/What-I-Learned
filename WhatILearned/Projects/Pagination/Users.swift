//
//  Users.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 09.09.23.
//

import Foundation

struct Users: Decodable {
    let page: Int
    let perPage: Int
    let total: Int
    let totalPages: Int
    let data: [User]
}

struct User: Decodable, Hashable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: URL
}
