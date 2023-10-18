//
//  BookmarkTip.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 09.10.23.
//

import TipKit

@available(iOS 17.0, *)
struct BookmarkTip: Tip {
    var title: Text {
        Text("Bookmark your idea!")
    }

    var message: Text? {
        Text("Bookmark your idea by pressing on the bookmark icon")
    }

    var image: Image? {
        Image(systemName: "bookmark")
    }

    var actions: [Action] {
        [
            .init(
                id: "1",
                perform: {
                    print("Bookmark")
                }, {
                    Text("Start bookmarking")
                }
            )
        ]
    }
}

@available(iOS 17.0, *)
struct BookmarkTipView: View {
    // Create an instance of your tip.
    var tip = BookmarkTip()

    var body: some View {
        // Show the TipView
        VStack {
            TipView(tip)
        }
    }
}

@available(iOS 17.0, *)
extension BookmarkTipView: ProjectProtocol {
    var version: IOSVersionTag {
        .iOS17
    }

    var tags: [Tag] {
        [.ui]
    }

    static let instance = BookmarkTipView()

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}

@available(iOS 17.0, *)
#Preview {
    BookmarkTipView()
}
