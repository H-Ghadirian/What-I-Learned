//
//  HomeView.swift
//  WhatILearned
//
//  Created by Paul, Arup, HSE DE on 20.07.23.
//

import Foundation
import SwiftUI

struct AppView: View {
    private let coordinator: AppCoordinator
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }

    var body: some View {
        TabView {
            coordinator.view(for: .home)
                .tabItem {
                    Label("Menu", systemImage: "house")
                }
            coordinator.view(for: .setting)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Setting")
                }
        }
    }
}
