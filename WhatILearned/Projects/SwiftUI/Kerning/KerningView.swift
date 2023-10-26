//
//  KerningView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 26.10.23.
//

import SwiftUI

struct KerningView: View {
    @State private var amount = 50.0

    var body: some View {
        VStack {
            Text("ffi")
                .font(.custom("AmericanTypewriter", size: 72))
                .kerning(amount)
            Text("ffi")
                .font(.custom("AmericanTypewriter", size: 72))
                .tracking(amount)

            Slider(value: $amount, in: 0...100) {
                Text("Adjust the amount of spacing")
            }
        }
    }
}
extension KerningView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS14)
    }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    static let instance = KerningView()
}
