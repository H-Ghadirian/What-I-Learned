//
//  SpotlightManager.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 13.12.23.
//

import Foundation
import UIKit
import CoreSpotlight
import MobileCoreServices

struct SpotlightModel {
    let id: String
    var title: String
    var content: String
    var keywords: [String]
}

enum SpotlightManager {
    static let domainIdentifier = "com.dogukaan.Marvel-Code-Case"

    static func configureSearchableItems() {

        let model = SpotlightModel(id: "0",
                                   title: "Marvel Heroes",
                                   content: "Tap to see your favourite Marvel heroes",
                                   keywords: [
                                    "marvel heroes",
                                    "marvel",
                                    "heroes",
                                    "hamed"
                                   ])

        let model2 = SpotlightModel(id: "1",
                                    title: "Marvel Characters",
                                    content: "Tap to see your favourite Marvel Character",
                                    keywords: [
                                        "captain america",
                                        "thor",
                                        "iron man",
                                        "hulk",
                                        "antman"
                                    ])

        var spotlightModels: [SpotlightModel] = []
        spotlightModels.append(model)
        spotlightModels.append(model2)

        let searchableItems = spotlightModels.map { item -> CSSearchableItem in
            let attributeSet: CSSearchableItemAttributeSet
            if #available(iOS 14, *) {
                attributeSet = .init(contentType: .content) // item
            } else {
                attributeSet = .init(itemContentType: kUTTypeText as String)
            }
            attributeSet.title = item.title
//            attributeSet.displayName = item.title
            attributeSet.contentDescription = item.content
            attributeSet.relatedUniqueIdentifier = item.id
            attributeSet.keywords = item.keywords

            return CSSearchableItem(
                uniqueIdentifier: item.id,
                domainIdentifier: SpotlightManager.domainIdentifier,
                attributeSet: attributeSet
            )
        }
        indexSearchableItems(items: searchableItems)
    }

    private static func indexSearchableItems(items: [CSSearchableItem]) {
        CSSearchableIndex.default().indexSearchableItems(items) { error in
            if let error = error {
                debugPrint(error)
            } else {
                debugPrint("indexing successful")
            }
        }
    }

    static func deleteIndexedSearchableItems() {
        CSSearchableIndex.default().deleteAllSearchableItems() { error in
            if let error = error {
                debugPrint(error)
            } else {
                debugPrint("index deleted successfully")
            }
        }
    }
}
