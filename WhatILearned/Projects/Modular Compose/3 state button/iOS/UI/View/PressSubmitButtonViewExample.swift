//
//  PressSubmitButtonViewExample.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 18.11.23.
//

import SwiftUI

struct PressSubmitButtonViewExample: View {
    @ObservedObject private var pressSubmitButtonViewStore: PressSubmitButtonViewStore
    @ObservedObject private var stateStore = PressButtonStateStore(.disable)

    init(store: PressSubmitButtonViewStore) {
        self.pressSubmitButtonViewStore = store
    }

    var body: some View {
        VStack {
            Toggle(
                "Disable",
                isOn: Binding(
                    get: { stateStore.value == .disable },
                    set: { _ in
                        withAnimation {
                            stateStore.value = .disable
                        }
                    }
                )
            )
            Toggle(
                "Loading",
                isOn: Binding(
                    get: { stateStore.value == .loading },
                    set: { _ in
                        withAnimation {
                            stateStore.value = .loading
                        }
                    }
                )
            )
            Toggle(
                "Enable",
                isOn: Binding(
                    get: { stateStore.value == .enable },
                    set: { _ in
                        withAnimation {
                            stateStore.value = .enable
                        }
                    }
                )
            )
            pressSubmitButtonViewStore.value
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
