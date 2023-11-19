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
    @State var storage: [Bool] = [true, false, false]

    init(store: PressSubmitButtonViewStore) {
        self.pressSubmitButtonViewStore = store
    }

    var body: some View {
        VStack {
            Toggle(
                "Disable",
                isOn: Binding(
                    get: { self.storage[0] },
                    set: { _ in
                        withAnimation {
                            self.storage = self.storage.enumerated().map { $0.0 == 0 }
                        }
                    }
                )
            )
            Toggle(
                "Loading",
                isOn: Binding(
                    get: { self.storage[1] },
                    set: { _ in
                        withAnimation {
                            self.storage = self.storage.enumerated().map { $0.0 == 1 }
                        }
                    }
                )
            )
            Toggle(
                "Enable",
                isOn: Binding(
                    get: { self.storage[2] },
                    set: { _ in
                        withAnimation {
                            self.storage = self.storage.enumerated().map { $0.0 == 2 }
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
