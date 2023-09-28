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

    let menuCoordinator: MenuCoordinator

    init(menuCoordinator: MenuCoordinator) {
        self.menuCoordinator = menuCoordinator
    }

    func view(for state: AppTabItem) -> AnyView {
        switch state {
        case .menu:
//            let viewModel = MenuViewModel(coordinator: menuCoordinator)
//            return AnyView(
//                NavigatorView(
//                    menuCoordinator,
//                    content: {
//                        return MenuView(viewModel: viewModel)
//                    }
//                )
//            )
//            return AnyView(ChrisNavigation())
            return AnyView(SearchableListView())
        case .profile:
            return AnyView(SettingTab())
        }
    }

    func start() {
    }
}
