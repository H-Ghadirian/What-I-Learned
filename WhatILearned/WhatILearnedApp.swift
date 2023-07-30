//
//  WhatILearnedApp.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 15.02.23.
//

import SwiftUI

@main
struct WhatILearnedApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    let paths: [MenuItem]
    let menuCoordinator: MenuCoordinator
    init() {
        paths = menu.flatMap { $0.items }
        menuCoordinator = MenuCoordinator(allPaths: paths)
    }
    var body: some Scene {
        WindowGroup {
            HomeView(coordinator: HomeCoordinator( menuCoordinator: menuCoordinator))
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .red

        let attrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.monospacedSystemFont(ofSize: 36, weight: .black)
        ]

        appearance.largeTitleTextAttributes = attrs

        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        return true
    }
}
