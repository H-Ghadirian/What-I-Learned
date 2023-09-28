//
//  Projects.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 28.09.23.
//

import Foundation
import SwiftUI

protocol ProjectProtocol: Identifiable {
    var id: UUID { get }
    var name: String { get }
    static func project() -> any ProjectProtocol
    static func run() -> AnyView
}

extension ProjectProtocol {
    var name: String { "\(Self.self)" }
    var id: UUID { UUID() }
}

enum Projects: CaseIterable {
    case sheets
    case macro
    case secondJsonMenuListView

    var view: AnyView {
        switch self {
        case .sheets:
            return TestSheets.run()
        case .macro:
            return TestMacro.run()
        case .secondJsonMenuListView:
            return SecondJsonMenuListView.run()
        }
    }

    var name: String {
        create.name
    }

    private var create: any ProjectProtocol {
        switch self {
        case .sheets:
            return TestSheets.project()
        case .macro:
            return TestMacro.project()
        case .secondJsonMenuListView:
            return SecondJsonMenuListView.project()
        }
    }
}
