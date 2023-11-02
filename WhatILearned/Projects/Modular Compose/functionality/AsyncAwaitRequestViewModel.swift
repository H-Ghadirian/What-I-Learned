//
//  AsyncAwaitRequestViewModel.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 02.11.23.
//

import SwiftUI

public class AsyncAwaitRequestViewModel {
    let source = RemoteFile(url: URL(string: "https://hws.dev/inbox.json")!, type: [Message].self)

    @State var messages = [Message]()

    func refresh() {
        Task {
            do {
                // Access the property asynchronously
                messages = try await source.contents
            } catch {
                print("Message update failed.")
            }
        }
    }
}
