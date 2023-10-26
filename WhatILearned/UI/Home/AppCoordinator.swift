//
//  HomeNavigator.swift
//  WhatILearned
//
//  Created by Paul, Arup, HSE DE on 20.07.23.
//

import Foundation
import SwiftUI

class AppCoordinator: CoordinatorProtocol {

    @Published var activePath: String?
    @Published var activeSheetPath: AppTabItem?
    var allPaths: [AppTabItem] {
        AppTabItem.allCases
    }

    func view(for state: AppTabItem) -> AnyView {
        switch state {
        case .home:
            if #available(iOS 16.0, *) {
                return AnyView(SearchableListView())
            } else {
                return AnyView(Text("WError: lower iOS version"))
            }
        case .setting:
            return AnyView(SettingTab())
        }
    }

    func start() {}
}
