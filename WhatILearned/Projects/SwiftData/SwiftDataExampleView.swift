//
//  SwiftDataExampleView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 10.12.23.
//

import Foundation
import SwiftData
import SwiftUI

@available(iOS 17.0, *)
struct SwiftDataExample: View {
    @Environment(\.modelContext) private var context
    @Query private var items: [DataItem]

    var body: some View {
        Button("Insert") {
            context.insert(DataItem(name: "Hamed"))
        }
        List {
            ForEach(items) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Button(action: {
                        item.name = "Updated Hamed"
                        try? context.save()
                    }, label: {
                        Image(systemName: "arrow.triangle.2.circlepath")
                    })
                }
            }
            .onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    context.delete(items[index])
                }
            })
        }
    }
}

@available(iOS 17.0, *)
extension SwiftDataExample: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.storage], version: .iOS17)
    }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    static var instance = SwiftDataExample()
}
