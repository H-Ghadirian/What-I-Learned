//
//  PressSubmitButtonViewExample.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 18.11.23.
//

import SwiftUI

struct PressSubmitButtonViewExample: View {
    @ObservedObject private var store: PressSubmitButtonViewStore
    init(store: PressSubmitButtonViewStore) {
        self.store = store
    }

    var body: some View {
        VStack {
            store.value
        }
        .padding()
    }
}

extension PressSubmitButtonViewExample: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.architecture], version: .iOS14)
    }

    static var instance = PressSubmitButtonViewExample(
        store: PressSubmitButtonViewStore(
            PressSubmitButtonView(
                buttonStateStore: PressButtonStateStore(.enable),
                viewModel: PressButtonViewModel()
            )
        )
    )
    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}
