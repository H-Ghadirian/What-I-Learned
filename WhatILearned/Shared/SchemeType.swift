//
//  SchemeType.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 03.08.23.
//

import Foundation

enum SchemeType: Int, Identifiable, CaseIterable {
    var id: Self { self }
    case system
    case light
    case dark
}

extension SchemeType {
    var title: String {
        switch self {
        case .system:
            return "📱 System"
        case .light:
            return "🌝 Light"
        case .dark:
            return "🌚 Dark"
        }
    }
}
