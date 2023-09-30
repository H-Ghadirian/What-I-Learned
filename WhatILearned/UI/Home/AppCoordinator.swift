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
        case .menu:
//            if let menu: MenuView<MenuViewModel> = MenuView.shared {
//                return AnyView(menu)
//            } else {
//                return
//            }
            return AnyView(SearchableListView())
        case .profile:
            return AnyView(SettingTab())
        }
    }

    func start() {}
}
