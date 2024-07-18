//
//  Projects.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 12.11.23.
//

import Foundation
enum Projects {
    static var list: [any ProjectProtocol] {
        var projectList = iOS14
        if #available(iOS 15.0, *) { projectList.append(contentsOf: Projects.iOS15) }
        if #available(iOS 16.0, *) { projectList.append(contentsOf: Projects.iOS16) }
        if #available(iOS 17.0, *) { projectList.append(contentsOf: Projects.iOS17) }
        return projectList
    }

    @available(iOS 17.0, *)
    private static let iOS17: [any ProjectProtocol] = [
        SwiftDataExample.project(),
        AnimatedSymbolsView.project(),
        BackgroundOverlayView.project(),
        BookmarkTipView.project()
    ]

    @available(iOS 16.0, *)
    private static let iOS16: [any ProjectProtocol] = [
        ZStackBackgroundColorProblem.project(),
        TestSheets.project(),
        SecondJsonMenuListView.project(),
        JsonMenuListView.project(),
        ChartsView.project(),
        PhotoPickerView.project(),
        ChrisNavigation.project(),
        OnTapGestureLocation.project()
    ]

    @available(iOS 15.0, *)
    private static let iOS15: [any ProjectProtocol] = [
        InfinitCarousalViewExample.project(),
        DropDownPickerExampleView.project(),
        ContinuationContentView.project(),
        AddArticleView.project(),
        DismissKeyboardView.project()
    ]

    private static let iOS14: [any ProjectProtocol] = [
        ProSwiftUIView.project(),
        TheMemoryLeakUIViewControllerRepresentable.project(),
        SpotlightSeatchExample.project(),
        TodayStepCountView.project(),
        PressSubmitButtonViewExample.project(),
        TestSpinnerView.project(),
        RunLoopVsDispatchQueueView.project(),
        LocalNotificationView.project(),
        TestMyFramework.project(),
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
}
