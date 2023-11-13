//
//  LocalNotificationView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 13.11.23.
//

import Foundation
import SwiftUI

struct LocalNotificationView: View {

    func setNotification() {
        let manager = LocalNotificationManager()
        manager.addNotification(title: "This is a test reminder")
        manager.schedule()
    }

    var body: some View {
        VStack {
            Text("Notification Demo")
            Button(
                action: { self.setNotification() }
            ) {
                Text("Set Notification!")
            }
        }
    }
}

extension LocalNotificationView: ProjectProtocol {
    var tags: ProjectTags {
        ProjectTags(
            tags: [.functionality],
            version: .iOS14
        )
    }

    static private let instance = LocalNotificationView()
    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationView()
    }
}
