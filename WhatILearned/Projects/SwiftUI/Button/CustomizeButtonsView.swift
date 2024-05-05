//
//  CustomizeButtonsView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 07.11.23.
//

import Foundation
import SwiftUI

public struct CustomizeButtonsView: View {

    public var body: some View {
        VStack(spacing: 10) {
            Button(action: {
                print("Image Button Pressed!")
            }) {
                Image(ImageResource.pexels1)
                    .resizable()
                    .renderingMode(.original)
                    .clipShape(Capsule())
                    .frame(width: 200, height: 400)
            }

            Button {
                print("Pressed!")
            } label: {
                Text("Sign Up")
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: .infinity)
            }
            .foregroundColor(.white)
            .padding()
            .background(Color(red: 0.65, green: 0.05, blue: 1))
            .cornerRadius(8)

            Button("Border Less") { }
                .buttonStyle(.borderless)
            Button("Plain Button") { }
                .buttonStyle(.plain)
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}

extension CustomizeButtonsView: ProjectProtocol {
    public var id: UUID { UUID() }
    var tags: ProjectTags {
        ProjectTags(
            tags: [.swiftui],
            version: .iOS14
        )
    }

    static private let instance = CustomizeButtonsView()
    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}

#Preview {
    CustomizeButtonsView()
}
