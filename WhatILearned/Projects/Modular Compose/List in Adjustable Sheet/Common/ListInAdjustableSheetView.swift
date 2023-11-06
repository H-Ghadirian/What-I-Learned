//
//  ListInAdjustableSheetView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 06.11.23.
//

import Foundation
import SwiftUI

struct ListInAdjustableSheetView: View {
    @State var showSheet = false
    var body: some View {
        Button("Show sheet") {
            showSheet.toggle()
        }
        if showSheet {
            AdjustableSheetUIComposer.createView()
        }
    }
}

extension ListInAdjustableSheetView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.functionality], version: .iOS14)
    }

    static let instance = ListInAdjustableSheetView()

    static func project() -> any ProjectProtocol {
        return instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}
