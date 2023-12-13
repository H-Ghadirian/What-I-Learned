//
//  SpotlightSeatchExample.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 13.12.23.
//

import Foundation
import SwiftUI

struct SpotlightSeatchExample: View {
    var body: some View {
        VStack {
            Button("Setup") {
                SpotlightManager.configureSearchableItems()
            }
            Button("Delete all") {
                SpotlightManager.deleteIndexedSearchableItems()
            }
        }
    }
}

extension SpotlightSeatchExample: ProjectProtocol {
    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    static let instance = SpotlightSeatchExample()

    var tags: ProjectTags {
        .init(tags: [.functionality], version: .iOS14)
    }

    var link: URL? {
        URL(string: "https://medium.com/@dogukaan.k/how-to-add-spotlight-search-entry-point-for-your-app-ee35b0501ab7")
    }
}
