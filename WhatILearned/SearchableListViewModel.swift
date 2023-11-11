//
//  SearchableListViewModel.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 21.10.23.
//

import SwiftUI

class SearchableListViewModel {
    private var projects: [any ProjectProtocol] = [
        PlayingWithNotifications.project(),
        CustomizeButtonsView.project(),
        ToggleExperiment.project(),
        ListInAdjustableSheetView.project(),
        KerningView.project(),
        DemoFloatingTextEditor.project(),
        DemoFloatingTextField.project(),
        ToastViewExample.project(),
        EssentialsCounterView.project(),
        RatingScreenView.project(),
        OldSheetView.project(),
        UserDefaultsView.project(),
        TheUIViewControllerRepresentable.project(),
        SheetNavigation.project(),
        AsyncAwaitRequest.project(),
        CounterAppView.project(),
        FakeNewsFeedView.project(),
        MenuView<MenuViewModel>.project(),
        LottieContentView.project(),
        TestTabView.project(),
        CollectionViewContent.project(),
        HapticTestView.project(),
        TestMyViewModifiersView.project(),
        TestMacro.project(),
        KeychainView.project(),
        MapView.project(),
        UsersView.project()
    ]
    init() {
        if #available(iOS 15.0, *) {
            projects.append(contentsOf:
                                [
                                    ContinuationContentView.project(),
                                    AddArticleView.project(),
                                    DismissKeyboardView.project()
                                ]
            )
        }
        if #available(iOS 16.0, *) {
            projects.append(contentsOf:
                                [
                                    TestSheets.project(),
                                    SecondJsonMenuListView.project(),
                                    JsonMenuListView.project(),
                                    ChartsView.project(),
                                    PhotoPickerView.project(),
                                    ChrisNavigation.project(),
                                    OnTapGestureLocation.project()
                                ]
            )
        }
        if #available(iOS 17.0, *) {
            projects.append(contentsOf:
                                [
                                    BackgroundOverlayView.project(),
                                    BookmarkTipView.project()
                                ]
            )
        }
    }
    private var searchResultProjects: [any ProjectProtocol] = []

    var title: String { "Projects \(numberOfProjects)" }
    var numberOfProjects: Int { projects.count }

    func iOSVersionOf(_ index: Int) -> Int {
        searchResultProjects[index].tags.version.rawValue
    }

    func presentationModeOf(project index: Int) -> PresentationMode {
        searchResultProjects[index].presentationMode
    }
    func colorOf(project index: Int) -> Color {
        switch searchResultProjects[index].tags.version {
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
    func viewOf(project index: Int) -> AnyView {
        type(of: searchResultProjects[index]).run()
    }
    func titleOf(project index: Int) -> String {
        "\(index + 1) - " + searchResultProjects[index].name
    }

    func getSearchResults(for text: String) -> [String] {
        if text.isEmpty {
            searchResultProjects = projects
        } else {
            searchResultProjects = projects.filter { $0.name.contains(text) }
        }
        return searchResultProjects.map { $0.name }
    }

    var iOSVersion: Int {
        Int(
            Double(
                UIDevice.current.systemVersion.split(separator: ".").first ?? "0"
            ) ?? 0
        )
    }
}
