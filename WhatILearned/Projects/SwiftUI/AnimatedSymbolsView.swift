//
//  AnimatedSymbolsView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 21.11.23.
//

import SwiftUI

@available(iOS 17.0, *)
struct AnimatedSymbolsView: View {
    @State private var animateReplace = false
    @State private var animateBounce = false
    @State private var animatePulse = false
    @State private var animateScale = false
    @State private var animateVariableColor = false

    var body: some View {
        ScrollView {
            VStack {
                // replace
                Link(
                    "Medium tutorial",
                    destination: URL(
                        string: "https://medium.com/gitconnected/modernizing-swiftui-for-ios-17-part-2-animated-symbols-fa6edb49cb2a"
                    )!
                )
                Button(
                    action: {
                        animateReplace.toggle()
                    }
                ) {
                    Image(systemName: animateReplace ? "checkmark.square" : "square")
                        .foregroundStyle(.green)
                        .font(.system(size: 100))
                        .symbolRenderingMode(.palette)
                    // new for iOS 17
                        .contentTransition(.symbolEffect(.replace))
                    Spacer()
                    Text("Replace")
                        .foregroundStyle(.green)
                        .fontDesign(.rounded)
                }
                // bounce
                Button(
                    action: {
                        animateBounce.toggle()
                    }
                ) {
                    Image(systemName: "camera.viewfinder")
                        .font(.system(size: 100))
                        .symbolEffect(.bounce.down.byLayer, value: animateBounce)
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.gray, .orange)
                    Spacer()
                    Text("Bounce")
                        .foregroundStyle(.orange)
                        .fontDesign(.rounded)
                }
                // pulse
                Button(
                    action: {
                        animatePulse.toggle()
                    }
                ) {
                    Image(systemName: "message.badge")
                        .font(.system(size: 100))
                        .symbolEffect(.pulse, options: .repeating, value: animatePulse)
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.blue)
                    Spacer()
                    Text("Pulse")
                        .foregroundStyle(.blue)
                        .fontDesign(.rounded)
                }
                // scale
                Button(action: {
                    animateScale.toggle()
                }) {
                    Image(systemName: "exclamationmark.triangle")
                        .font(.system(size: 100))
                        .foregroundStyle(.red)
                        .symbolEffect(.scale.up, isActive: animateScale)
                        .symbolRenderingMode(.monochrome)
                    Spacer()
                    Text("Scale")
                        .foregroundStyle(.red)
                        .fontDesign(.rounded)
                }
                // variable color
                Button(action: {
                    animateVariableColor.toggle()
                }) {
                    Image(systemName: "rainbow")
                        .font(.system(size: 100))
                        .symbolEffect(
                            .variableColor.iterative.dimInactiveLayers,
                            options: .speed(10).repeat(5),
                            value: animateVariableColor
                        )
                        .symbolRenderingMode(.multicolor)
                    Spacer()
                    Text("Variable Color")
                        .foregroundStyle(.purple)
                        .fontDesign(.rounded)
                }
            }
            .font(.title)
        }
    }
}

@available(iOS 17.0, *)
extension AnimatedSymbolsView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS17)
    }

    static let instance = AnimatedSymbolsView()
    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}
