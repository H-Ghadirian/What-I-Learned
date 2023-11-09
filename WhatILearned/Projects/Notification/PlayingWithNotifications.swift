//
//  HandlingUIApplicationState.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 09.11.23.
//

import SwiftUI

extension Notification.Name {
    static let taskAddedNotification = Notification.Name("TaskAddedNotification")
}

struct PlayingWithNotifications: View {
    @State private var appState = "UIApplication Notifs:\n"
    @State private var newTask: String?

    var body: some View {
        ZStack {
            VStack {
                Text(appState)
                Button("Post Notification") {
                    NotificationCenter.default.post(
                        name: Notification.Name.taskAddedNotification,
                        object: nil,
                        userInfo: ["UserInfo": "Wash the dishes"]
                    )
                }
                Text(newTask ?? "no task received")
                    .onReceive(NotificationCenter.default.publisher(for: Notification.Name.taskAddedNotification))
                { data in
                    // Change key as per your "UserLogs"
                    guard let userInfo = data.userInfo, let info = userInfo["UserInfo"] as? String else {
                        return
                    }
                    newTask = info
                }
            }
        }
        .onReceive(
            NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification, object: nil)
        ) { _ in
            appState += "App Will Resign\n"
        }
        .onReceive(
            NotificationCenter.default.publisher(for: UIApplication.willTerminateNotification, object: nil)
        ) { _ in
            appState += "App Will Terminate\n"
        }
        .onReceive(
            NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification, object: nil)
        ) { _ in
            appState += "App Will Enter Foreground\n"
        }
        .onReceive(
            NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification, object: nil)
        ) { _ in
            appState += "App Did Become Active\n"
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(self)
        }

    }
}

extension PlayingWithNotifications: ProjectProtocol {
    var tags: ProjectTags {
        ProjectTags(
            tags: [.functionality],
            version: .iOS14
        )
    }

    static private let instance = PlayingWithNotifications()
    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}
