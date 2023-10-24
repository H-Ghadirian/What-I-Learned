//
//  ProjectTags.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 21.10.23.
//

import Foundation

struct ProjectTags {
    var tags: [Tag]
    var version: IOSVersionTag
}

enum Tag {
    case animation
    case swiftui
    case userInterface
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
