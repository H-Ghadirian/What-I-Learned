//
//  Projects.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 28.09.23.
//

import Foundation
import SwiftUI

enum Projects: CaseIterable {
    case oldSheetView
    case userDefaultsView
    case theUIViewControllerRepresentable
    case keychainView
    case bookmarkTipView
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
            if #available(iOS 16.0, *) {
                return TestSheets.run()
            } else {
                fatalError("WError: lower iOS version")
            }
        case .macro:
            return TestMacro.run()
        case .secondJsonMenuListView:
            if #available(iOS 16.0, *) {
                return SecondJsonMenuListView.run()
            } else {
                fatalError("WError: lower iOS version")
            }
        case .viewModifiersView:
            return TestMyViewModifiersView.run()
        case .jsonMenuListView:
            if #available(iOS 16.0, *) {
                return JsonMenuListView.run()
            } else {
                fatalError("WError: lower iOS version")
            }
        case .hapticTestView:
            return HapticTestView.run()
        case .chartsView:
            if #available(iOS 16.0, *) {
                return ChartsView.run()
            } else {
                fatalError("WError: lower iOS version")
            }
        case .backgroundOverlayView:
            if #available(iOS 17.0, *) {
                return BackgroundOverlayView.run()
            } else {
                fatalError("WError: lower iOS version")
            }
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
            if #available(iOS 15.0, *) {
                return ContinuationContentView.run()
            } else {
                fatalError("WError: lower iOS version")
            }
        case .usersView:
            return UsersView.run()
        case .counterAppView:
            return CounterAppView.run()
        case .photoPickerView:
            if #available(iOS 16.0, *) {
                return PhotoPickerView.run()
            } else {
                fatalError("WError: lower iOS version")
            }
        case .mapView:
            return MapView.run()
        case .chrisNavigation:
            if #available(iOS 16.0, *) {
                return ChrisNavigation.run()
            } else {
                fatalError("WError: lower iOS version")
            }
        case .addArticleView:
            if #available(iOS 15.0, *) {
                return AddArticleView.run()
            } else {
                fatalError("WError: lower iOS version")
            }
        case .asyncAwaitRequest:
            return AsyncAwaitRequest.run()
        case .sheetNavigation:
            return SheetNavigation.run()
        case .bookmarkTipView:
            if #available(iOS 17.0, *) {
                return BookmarkTipView.run()
            } else {
                fatalError("WError: lower iOS version")
            }
        case .keychainView:
            return KeychainView.run()
        case .theUIViewControllerRepresentable:
            return TheUIViewControllerRepresentable.run()
        case .userDefaultsView:
            return UserDefaultsView.run()
        case .oldSheetView:
            return OldSheetView.run()
        }
    }

    var color: Color {
        switch iOSVersion {
        case .iOS14:
            return .red
        case .iOS15:
            return .purple
        case .iOS16:
            return .green
        case .iOS17:
            return .yellow
        }
    }

    var iOSVersion: IOSVersionTag {
        create.version
    }

    var tags: [Tag] {
        create.tags
    }

    var name: String {
        create.name
    }

    private var create: any ProjectProtocol {
        switch self {
        case .sheets:
            if #available(iOS 16.0, *) {
                return TestSheets.project()
            } else {
                fatalError("WError: lower iOS version")
            }
        case .macro:
            return TestMacro.project()
        case .secondJsonMenuListView:
            if #available(iOS 16.0, *) {
                return SecondJsonMenuListView.project()
            } else {
                fatalError("WError: lower iOS version")
            }
        case .viewModifiersView:
            return TestMyViewModifiersView.project()
        case .jsonMenuListView:
            if #available(iOS 16.0, *) {
                return JsonMenuListView.project()
            } else {
                fatalError("WError: lower iOS version")
            }
        case .hapticTestView:
            return HapticTestView.project()
        case .chartsView:
            if #available(iOS 16.0, *) {
                return ChartsView.project()
            } else {
                fatalError("WError: lower iOS version")
            }
        case .backgroundOverlayView:
            if #available(iOS 17.0, *) {
                return BackgroundOverlayView.project()
            } else {
                fatalError("WError: lower iOS version")
            }
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
            if #available(iOS 15.0, *) {
                return ContinuationContentView.project()
            } else {
                fatalError("WError: lower iOS version")
            }
        case .usersView:
            return UsersView.project()
        case .counterAppView:
            return CounterAppView.project()
        case .photoPickerView:
            if #available(iOS 16.0, *) {
                return PhotoPickerView.project()
            } else {
                fatalError("WError: lower iOS version")
            }
        case .mapView:
            return MapView.project()
        case .chrisNavigation:
            if #available(iOS 16.0, *) {
                return ChrisNavigation.project()
            } else {
                fatalError("WError: lower iOS version")
            }
        case .addArticleView:
            if #available(iOS 15.0, *) {
                return AddArticleView.project()
            } else {
                fatalError("WError: lower iOS version")
            }
        case .asyncAwaitRequest:
            return AsyncAwaitRequest.project()
        case .sheetNavigation:
            return SheetNavigation.project()
        case .bookmarkTipView:
            if #available(iOS 17.0, *) {
                return BookmarkTipView.project()
            } else {
                fatalError("WError: lower iOS version")
            }
        case .keychainView:
            return KeychainView.project()
        case .theUIViewControllerRepresentable:
            return TheUIViewControllerRepresentable.project()
        case .userDefaultsView:
            return UserDefaultsView.project()
        case .oldSheetView:
            return OldSheetView.project()
        }
    }
}
