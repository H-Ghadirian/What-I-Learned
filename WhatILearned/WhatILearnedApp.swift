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
    @State private var toast: FancyToast?

    let paths: [MenuItem]
    let menuCoordinator: MenuCoordinator
    init() {
        paths = menu.flatMap { $0.items }
        menuCoordinator = MenuCoordinator(allPaths: paths)
    }

    var body: some Scene {
        WindowGroup {
            AppView(coordinator: AppCoordinator( menuCoordinator: menuCoordinator))
                .onOpenURL { url in
                    handle(url)
                }
                .toastView(toast: $toast)
                .environment(\.locale, .init(identifier: "en"))
        }
    }

    private func handle(_ url: URL) {
        // you can test from simulator:
        // xcrun simctl openurl booted "whatIlearned://test?id=123"
        print(url.absoluteString)
        print(url.scheme ?? "")
        if url.scheme == "whatIlearned" {
            // Parse the query parameters
            let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            print(components ?? "")
            print(components?.queryItems ?? "")
            if let productId = components?.queryItems?.first(where: { $0.name == "id" })?.value {
                toast = FancyToast(type: .info, title: "Toast info", message: productId)
            }
        }
    }
}
