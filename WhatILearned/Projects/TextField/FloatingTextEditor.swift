//
//  FloatingTextTextEditor.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 24.10.23.
//

import Foundation
import SwiftUI

struct FloatingTextEditor: View {
    private let textEditorHeight: CGFloat = 100
    private let placeHolderText: String
    private var shouldPlaceHolderMove: Bool {
        isEditing || (text.count != 0)
    }
    @State private var isEditing = false

    @Binding var text: String
    public init(
        placeHolder: String,
        text: Binding<String>
    ) {
        self._text = text
        self.placeHolderText = placeHolder
    }

    var body: some View {
        ZStack(alignment: .leading) {
            texteditor
            placeholderText
        }
        .frame(height: textEditorHeight + 30)
    }

    private var placeholderText: some View {
        Text(placeHolderText)
            .foregroundColor(Color.secondary)
            .background(Color(UIColor.white))
            .padding(placeholderPadding)
            .scaleEffect(shouldPlaceHolderMove ? 1.0 : 1.2)
            .animation(.linear)
    }

    private var placeholderPadding: EdgeInsets {
        shouldPlaceHolderMove ? getEdgeInsets(bottom: textEditorHeight) : getEdgeInsets()
    }

    private func getEdgeInsets(bottom: CGFloat = 0) -> EdgeInsets {
        EdgeInsets(top: 0, leading: 15, bottom: bottom, trailing: 0)
    }

    private var texteditor: some View {
        TextEditor(text: $text)
            .onTapGesture {
                isEditing = true
            }
            .lineLimit(5)
            .padding()
            .overlay(roundedRectangle)
            .foregroundColor(Color.black)
            .accentColor(Color.black)
            .animation(.linear)
    }

    private var roundedRectangle: some View {
        RoundedRectangle(cornerRadius: 8)
            .stroke(Color.secondary, lineWidth: 1)
            .frame(height: textEditorHeight)
    }
}

struct DemoFloatingTextEditor: View {
    @State var username: String = ""
    @State var email: String = ""

    var body: some View {
        VStack {
            FloatingTextEditor(placeHolder: " Name ", text: $username)
            FloatingTextEditor(placeHolder: " Email ", text: $email)
        }
        .padding()
        .border(.black)
    }
}

extension DemoFloatingTextEditor: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS14)
    }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    static let instance = DemoFloatingTextEditor()
}

struct FloatingTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        DemoFloatingTextEditor()
    }
}
