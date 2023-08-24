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
    @State private var toast: FancyToast? = nil

    let paths: [MenuItem]
    let menuCoordinator: MenuCoordinator
    init() {
        paths = menu.flatMap { $0.items }
        menuCoordinator = MenuCoordinator(allPaths: paths)
    }
    var body: some Scene {
        WindowGroup {
            HomeView(coordinator: HomeCoordinator( menuCoordinator: menuCoordinator))
                .onOpenURL { url in
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
                .toastView(toast: $toast)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Colors.primary)

        let attrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.monospacedSystemFont(ofSize: 36, weight: .black)
        ]

        appearance.largeTitleTextAttributes = attrs

        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        return true
    }
}
