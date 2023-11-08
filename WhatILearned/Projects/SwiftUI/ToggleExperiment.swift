//
//  ToggleExperiment.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 09.11.23.
//

import Foundation
import SwiftUI

public struct ToggleExperiment: View {
    @State private var toggleValue: Bool = false

    public var body: some View {
        VStack(spacing: 20) {
            Toggle(isOn: $toggleValue) {
                Text("I'm an iOS toggle!")
            }
            .frame(width: 300)

            Toggle(isOn: $toggleValue) {
                Text("I'm a checkbox now!")
            }
            .toggleStyle(CheckboxToggleStyle())
        }
    }
}

extension ToggleExperiment: ProjectProtocol {
    public var id: UUID { UUID() }
    var tags: ProjectTags {
        ProjectTags(
            tags: [.functionality],
            version: .iOS14
        )
    }

    static private let instance = ToggleExperiment()
    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}
