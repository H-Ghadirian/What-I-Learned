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
    case sheetNavigation
    case asyncAwaitRequest
    case addArticleView
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
    case lottieView
    case menuView
    case fakeNewsFeedView
    case continuationContentView
    case usersView
    case counterAppView
    case photoPickerView
    case mapView
    case chrisNavigation

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
        case .lottieView:
            return LottieContentView.run()
        case .menuView:
            return MenuView<MenuViewModel>.run()
        case .fakeNewsFeedView:
            return FakeNewsFeedView.run()
        case .continuationContentView:
            return ContinuationContentView.run()
        case .usersView:
            return UsersView.run()
        case .counterAppView:
            return CounterAppView.run()
        case .photoPickerView:
            return PhotoPickerView.run()
        case .mapView:
            return MapView.run()
        case .chrisNavigation:
            return ChrisNavigation.run()
        case .addArticleView:
            return AddArticleView.run()
        case .asyncAwaitRequest:
            return AsyncAwaitRequest.run()
        case .sheetNavigation:
            return SheetNavigation.run()
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
        case .lottieView:
            return LottieContentView.project()
        case .menuView:
            return MenuView<MenuViewModel>.project()
        case .fakeNewsFeedView:
            return FakeNewsFeedView.project()
        case .continuationContentView:
            return ContinuationContentView.project()
        case .usersView:
            return UsersView.project()
        case .counterAppView:
            return CounterAppView.project()
        case .photoPickerView:
            return PhotoPickerView.project()
        case .mapView:
            return MapView.project()
        case .chrisNavigation:
            return ChrisNavigation.project()
        case .addArticleView:
            return AddArticleView.project()
        case .asyncAwaitRequest:
            return AsyncAwaitRequest.project()
        case .sheetNavigation:
            return SheetNavigation.project()
        }
    }
}
