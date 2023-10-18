//
//  ProjectProtocol.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 09.10.23.
//

import Foundation
import SwiftUI

protocol ProjectProtocol: Identifiable {
    var id: UUID { get }
    var name: String { get }
    var tags: [Tag] { get }
    var version: IOSVersionTag { get }
    static func project() -> any ProjectProtocol
    static func run() -> AnyView
}

extension ProjectProtocol {
    var name: String { "\(Self.self)" }
    var id: UUID { UUID() }
}

// swiftui:disable identifier_name
enum Tag {
    case animation
    case swiftui
    case ui
    case networking
    case storage
    case functionality
    case architecture
    case library
}

enum IOSVersionTag: Int, Comparable {
    static func < (lhs: IOSVersionTag, rhs: IOSVersionTag) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

    case iOS14 = 14
    case iOS15 = 15
    case iOS16 = 16
    case iOS17 = 17
}
