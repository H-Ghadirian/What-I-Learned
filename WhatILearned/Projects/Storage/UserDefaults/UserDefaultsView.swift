//
//  UserDefaultsView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 15.10.23.
//

import Foundation
import SwiftUI

struct UserDefaultsView: View {

    let viewModel = UserDefaultsViewModel()

    var body: some View {
        VStack {
            Button("Save") {
                viewModel.save()
            }
            Button("Retrieve") {
                viewModel.load()
            }
            Button("Delete") {
                viewModel.remove()
            }
        }
    }
}

extension UserDefaultsView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.functionality], version: .iOS14)
    }

    static let instance = UserDefaultsView()

    static func project() -> any ProjectProtocol {
        return instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}

#Preview {
    UserDefaultsView()
}
