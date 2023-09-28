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
    case jsonMenuListView
    case secondJsonMenuListView
    case viewModifiersView
    case hapticTestView
    case chartsView
    case backgroundOverlayView
    case collectionViewContent
    case testTabView

    var view: AnyView {
        switch self {
        case .sheets:
            return TestSheets.run()
        case .macro:
            return TestMacro.run()
        case .secondJsonMenuListView:
            return SecondJsonMenuListView.run()
        case .viewModifiersView:
            return TestMyViewModifiersView.run()
        case .jsonMenuListView:
            return JsonMenuListView.run()
        case .hapticTestView:
            return HapticTestView.run()
        case .chartsView:
            return ChartsView.run()
        case .backgroundOverlayView:
            return BackgroundOverlayView.run()
        case .collectionViewContent:
            return CollectionViewContent.run()
        case .testTabView:
            return TestTabView.run()
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
        case .viewModifiersView:
            return TestMyViewModifiersView.project()
        case .jsonMenuListView:
            return JsonMenuListView.project()
        case .hapticTestView:
            return HapticTestView.project()
        case .chartsView:
            return ChartsView.project()
        case .backgroundOverlayView:
            return BackgroundOverlayView.project()
        case .collectionViewContent:
            return CollectionViewContent.project()
        case .testTabView:
            return TestTabView.project()
        }
    }
}
