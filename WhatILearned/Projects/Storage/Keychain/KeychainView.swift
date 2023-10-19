//
//  KeychainView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 10.10.23.
//

import Foundation
import SwiftUI

struct KeychainView: View {

    let viewModel = KeychainViewModel()

    var body: some View {
        VStack {
            Button("Save") {
                viewModel.save()
            }
            Button("Retrieve") {
                viewModel.retrieve()
            }
            Button("Update") {
                viewModel.update()
            }
            Button("Delete") {
                viewModel.delete()
            }
        }
    }
}

extension KeychainView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.functionality], version: .iOS14)
    }

    static let instance = KeychainView()

    static func project() -> any ProjectProtocol {
        return instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}
