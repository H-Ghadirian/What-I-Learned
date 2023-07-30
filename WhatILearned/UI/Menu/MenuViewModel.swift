//
//  MenuViewModel.swift
//  WhatILearned
//
//  Created by Paul, Arup, HSE DE on 20.07.23.
//

import Foundation
protocol MenuViewModelProtocol: ObservableObject {
    var menus: [MenuSection] { get }
    func goto(_ path: MenuCoordinator.Path)
}

class MenuViewModel: MenuViewModelProtocol {
    @Published var menus = [MenuSection]()
    private let coordinator: MenuCoordinator

    init(coordinator: MenuCoordinator) {
        self.coordinator = coordinator
        self.menus = Bundle.main.decode([MenuSection].self, from: "menu.json")
    }
    
    func goto(_ path: MenuCoordinator.Path) {
        coordinator.goto(path)
    }
}
