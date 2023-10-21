//
//  RatingScreenView+.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 21.10.23.
//

import SwiftUI

extension RatingScreenView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS14)
    }
    var presentationMode: PresentationMode { .modal }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    private static let instance = RatingScreenView(viewModel: RatingScreenViewModel())
}
