//
//  MenuView.swift
//  WhatILearned
//
//  Created by Paul, Arup, HSE DE on 20.07.23.
//

import Foundation
import SwiftUI

private struct MainAppFactory {
    static var singletonsStore: [String: AnyObject] = [:]
}

struct MenuView<ViewModel: MenuViewModelProtocol>: View, ProjectProtocol {
    static func project() -> any ProjectProtocol {
        return shared!
    }

    static func run() -> AnyView {
        AnyView(shared)
    }

    static var shared: MenuView<ViewModel>? {
        let storeKey = String(describing: ViewModel.self)
        if let singleton = MainAppFactory.singletonsStore[storeKey] as? MenuView<ViewModel> {
            return singleton
        } else {
            let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
            var paths = menu.flatMap { $0.items }
            var menuCoordinator = MenuCoordinator(allPaths: paths)
            if let viewModel = MenuViewModel(coordinator: menuCoordinator) as? ViewModel {
                let newSingleton = MenuView<ViewModel>(viewModel: viewModel)
                MainAppFactory.singletonsStore[storeKey] = newSingleton as AnyObject
                return newSingleton
            }
        }
        return nil
    }

    @ObservedObject private var viewModel: ViewModel

    @AppStorage("systemThemeVal") private var systemTheme: Int = SchemeType.allCases.first!.rawValue

    var selectedScheme: ColorScheme? {
        guard let theme = SchemeType(rawValue: systemTheme) else { return nil }
        switch theme {
        case .light:
            return .light
        case .dark:
            return .dark
        default:
            return nil
        }
    }

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            List {
                ForEach(viewModel.menus, id: \.id) { section in
                    Section {
                        ForEach(section.items, id: \.id) { item in
                            HStack {
                                Image(systemName: "chevron.right")
                                Text(item.name)
                            }.onTapGesture {
                                viewModel.goto(item)
                            }
                        }
                    } header: {
                        Text(section.name)
                    }
                }
            }
        }
        .preferredColorScheme(selectedScheme)
    }
}
