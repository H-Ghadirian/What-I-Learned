//
//  HomeNavigator.swift
//  WhatILearned
//
//  Created by Paul, Arup, HSE DE on 20.07.23.
//

import Foundation
import SwiftUI

enum HomeTabItem: String, Hashable, Identifiable, CaseIterable {
    var id: String {
        self.rawValue
    }
    case menu
    case profile
}

class HomeCoordinator: CoordinatorProtocol {

    @Published var activePath: String?
    @Published var activeSheetPath: HomeTabItem?
    var allPaths: [HomeTabItem] {
        HomeTabItem.allCases
    }

    let menuCoordinator: MenuCoordinator

    init(menuCoordinator: MenuCoordinator) {
        self.menuCoordinator = menuCoordinator
    }

    func view(for state: HomeTabItem) -> AnyView {
        switch state {
        case .menu:
            let viewModel = MenuViewModel(coordinator: menuCoordinator)
            return AnyView(
                NavigatorView(
                    menuCoordinator,
                    content: {
                        return MenuView(viewModel: viewModel)
                    }
                )
            )
        case .profile:
            return AnyView(SettingTab())
        }
    }

    func start() {
    }
}
