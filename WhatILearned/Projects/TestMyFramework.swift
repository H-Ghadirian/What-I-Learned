//
//  TestMyFramework.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 12.11.23.
//

import Foundation
import SwiftUI
// import MyFramework // bug: it avoid to run on a real device!

public struct TestMyFramework: View {
    public var body: some View {
        Button("SomeInfoFromFramework().bookTitle") {
            print("worked!")
        }
    }
}

extension TestMyFramework: ProjectProtocol {
    public var id: UUID { UUID() }
    var tags: ProjectTags {
        ProjectTags(
            tags: [.functionality],
            version: .iOS14
        )
    }

    static private let instance = TestMyFramework()
    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}
