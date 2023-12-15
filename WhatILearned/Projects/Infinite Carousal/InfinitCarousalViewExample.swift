//
//  InfinitCarousalViewExample.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 15.12.23.
//
import Foundation
import SwiftUI

@available(iOS 15.0, *)
struct InfinitCarousalViewExample: View {

    var body: some View {
        InfinitCarousalView(itemHeight: 500, views: getViews())
    }

    func getViews() -> [AnyView] {
        let images: [String] = [
            "Pexels1",
            "Pexels2",
            "Pexels3",
            "Pexels4",
            "Pexels5",
            "Pexels6",
            "Pexels7",
            "Pexels8"
        ]

        var views: [AnyView] = []

        for image in images {
            views.append(
                AnyView(
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                )
            )
        }

        return views
    }
}

@available(iOS 15.0, *)
extension InfinitCarousalViewExample: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS15)
    }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
    var link: URL? {
        URL(string: "https://blog.stackademic.com/infinite-carousal-ios-swiftui-b7801dd746dc")
    }
    static let instance = InfinitCarousalViewExample()
}
