//
//  DismissKeyboardView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 29.10.23.
//

import SwiftUI

@available(iOS 15.0, *)
struct DismissKeyboardView: View {
    @State private var username = ""
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .focused($isFocused)

            Button("Sign In") {
                isFocused = false
            }
        }
        .padding()
    }
}

@available(iOS 15.0, *)
extension DismissKeyboardView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS15)
    }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    static let instance = DismissKeyboardView()
}
