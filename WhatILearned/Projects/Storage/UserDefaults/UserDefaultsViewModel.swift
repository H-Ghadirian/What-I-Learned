//
//  UserDefaults.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 15.10.23.
//

import Foundation

struct UserDefaultsViewModel {

    private let defaults = UserDefaults.standard
    private let profileKey = "myProfile"

    func save() {
        let myProfile = Profile(
            username: "Hamed",
            age: 100,
            gender: "Male",
            active: true,
            lastSeen: Date()
        )
//        defaults.set(myProfile, forKey: "myProfile") // you will get error
        let encoder = JSONEncoder()
        if let encodedUser = try? encoder.encode(myProfile) {
            defaults.set(encodedUser, forKey: profileKey)
        }
    }

    func load() {
        if let savedUser = defaults.object(forKey: profileKey) as? Data {
            let decoder = JSONDecoder()
            if let savedUser = try? decoder.decode(Profile.self, from: savedUser) {
                print("Saved User: \(savedUser)")
            } else {
                print("failed to decode!")
            }
        } else {
            print("Failed to load as Data")
        }
    }

    func remove() {
        defaults.removeObject(forKey: profileKey)
    }
}

struct Profile: Codable {
    let username: String
    let age: Int
    let gender: String
    let active: Bool
    let lastSeen: Date
}
