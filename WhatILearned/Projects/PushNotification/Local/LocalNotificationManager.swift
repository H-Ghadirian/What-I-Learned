//
//  LocalNotificationManager.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 13.11.23.
//

import Foundation
import UserNotifications

struct LocalPushNotification {
    var id: String
    var title: String
}

class LocalNotificationManager {
    var notifications = [LocalPushNotification]()

    private func requestPermission() {
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.alert, .badge, .alert]) { [weak self] granted, error in
                if granted == true && error == nil {
                    self?.scheduleNotifications()
                }
            }
    }

    func addNotification(title: String) {
        notifications.append(LocalPushNotification(id: UUID().uuidString, title: title))
    }

    private func scheduleNotifications() {
        for notification in notifications {
            let content = UNMutableNotificationContent()
            content.title = notification.title

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request) { error in
                guard error == nil else { return }
                print("Scheduling notification with id: \(notification.id)")
            }
        }
    }

    func schedule() -> Void {
          UNUserNotificationCenter.current().getNotificationSettings { settings in
              switch settings.authorizationStatus {
              case .notDetermined:
                  self.requestPermission()
              case .authorized, .provisional:
                  self.scheduleNotifications()
              default:
                  break
              }
          }
      }
}
