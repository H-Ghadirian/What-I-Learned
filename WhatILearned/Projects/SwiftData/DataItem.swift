//
//  DataItem.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 09.12.23.
//

import Foundation
import SwiftData

@available(iOS 17.0, *)
@Model
class DataItem: Identifiable {
    var id: String
    var name: String

    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
}
