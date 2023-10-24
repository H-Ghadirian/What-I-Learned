//
//  FloatingTextEditorTests.swift
//  WhatILearnedTests
//
//  Created by Ghadirian, Hamed, HSE DE on 24.10.23.
//

@testable import WhatILearned
import XCTest
import SwiftUI
import ViewInspector

// swiftlint:disable force_try
final class FloatingTextEditorTests: XCTestCase {
    func test_init() {
        let sut = makeSUT()
        XCTAssertEqual(sut.getPlaceholderString(), placeholderString)
        XCTAssertEqual("Hi", sut.inputText)
    }

    func test_inputShouldSetCorrectly() {
        let initText = "hello"
        let initValue = Binding<String>(wrappedValue: initText)
        let sut = makeSUT(initInput: initValue)
        XCTAssertEqual(sut.getPlaceholderString(), placeholderString)
        XCTAssertEqual(initText, sut.inputText)
        let newText = "new value need to be set"
        sut.setInput(text: newText)
        XCTAssertEqual(newText, initValue.wrappedValue)
        XCTAssertEqual(newText, sut.inputText)
    }

    // MARK: - Helper Methods
    private func makeSUT(
        placeholder: String = "placeholder",
        initInput: Binding<String> = .constant("Hi")
    ) -> FloatingTextEditor {
        FloatingTextEditor(placeHolder: placeholder, text: initInput)
    }
    private let placeholderString = "placeholder"
}

private extension FloatingTextEditor {
    func texteditor() -> InspectableView<ViewType.TextEditor> {
        try! inspect().find(ViewType.TextEditor.self)
    }
    func setInput(text: String) {
        try! texteditor().setInput(text)
    }

    var inputText: String {
        try! texteditor().input()
    }

    func getPlaceholderString() -> String {
        try! inspect().find(ViewType.Text.self).string()
    }
}
// swiftlint:enable force_try
