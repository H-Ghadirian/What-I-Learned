//
//  TextFieldAnimatedPlaceholderView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 23.10.23.
//

import SwiftUI

struct FloatingTextField: View {
    private let textFieldHeight: CGFloat = 100
    private let placeHolderText: String
    private var shouldPlaceHolderMove: Bool {
        isEditing || (text.count != 0)
    }

    @Binding var text: String
    @State private var isEditing = false
    public init(
        placeHolder: String,
        text: Binding<String>
    ) {
        self._text = text
        self.placeHolderText = placeHolder
    }

    var body: some View {
        ZStack(alignment: .leading) {
            TextField(
                "",
                text: $text,
                onEditingChanged: { edit in
                    isEditing = edit
                }
            )
            .lineLimit(5)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(Color.secondary, lineWidth: 1)
            .frame(height: textFieldHeight))
            .foregroundColor(Color.green)
            .accentColor(Color.secondary)
            .animation(.linear)

            Text(placeHolderText)
            .foregroundColor(Color.secondary)
            .background(Color(UIColor.red))
            .padding(
                shouldPlaceHolderMove ?
                     EdgeInsets(top: 0, leading: 15, bottom: textFieldHeight, trailing: 0) :
                     EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0)
            )
            .scaleEffect(shouldPlaceHolderMove ? 1.0 : 1.2)
            .animation(.linear)
        }
        .frame(height: textFieldHeight + 30)
    }
}

struct DemoFloatingTextField: View {
    @State var username: String = ""
    @State var email: String = ""
    var body: some View {
        VStack {
            FloatingTextField(placeHolder: "Name", text: $username)
                .border(.blue)
            FloatingTextField(placeHolder: "Email", text: $email)
                .border(.blue)
        }
        .padding()
        .border(.black)
    }
}

extension DemoFloatingTextField: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS14)
    }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    static let instance = DemoFloatingTextField()
}

struct FloatingTextField_Previews: PreviewProvider {
    static var previews: some View {
        DemoFloatingTextField()
    }
}
