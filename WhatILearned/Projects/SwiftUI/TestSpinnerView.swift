//
//  Spinner.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 16.11.23.
//

import Foundation
import SwiftUI

struct TestSpinnerView: View {
    // MARK: - Properties
    @State private var showSpinner: Bool = false

    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                Link(
                    "Medium tutorial",
                    destination: URL(
                        string: "https://medium.com/@ganeshrajugalla/creating-beautiful-custom-loaders-with-swiftui-4ca99f3591b4"
                    )!
                )
                Button {
                    showSpinner.toggle()
                } label: {
                    Text(showSpinner ? "Stop Spinner" : "Start Spinner")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(width: 160)
                        .background(
                            LinearGradient(
                                colors: [.red, .blue],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)
                        )
                        .cornerRadius(8)
                }
                .padding(20)
                if showSpinner {
                    SpinnerView()
                }
            }
        }
    }
}

extension TestSpinnerView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS14)
    }

    static var instance = TestSpinnerView()
    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

}

struct TestSpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        TestSpinnerView()
    }
}
