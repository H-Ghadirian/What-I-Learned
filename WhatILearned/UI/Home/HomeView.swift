//
//  HomeView.swift
//  WhatILearned
//
//  Created by Paul, Arup, HSE DE on 20.07.23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    private let coordinator: HomeCoordinator
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }

    var body: some View {
        TabView {
            coordinator.view(for: .menu)
                .tabItem {
                    Label("Menu", systemImage: "house")
                }
            coordinator.view(for: .profile)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
        }
    }
}
