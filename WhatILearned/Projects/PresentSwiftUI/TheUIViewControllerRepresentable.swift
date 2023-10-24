//
//  TheUIViewControllerRepresentable.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 12.10.23.
//

import SwiftUI
import UIKit

struct TheUIViewControllerRepresentable: View {
    @State var isPresented = false

    var body: some View {
        VStack {
            Text("This a SwiftUI View")
            Button("Present a ViewController") {
                isPresented = true
            }
            .sheet(isPresented: $isPresented) {
                MyView()
            }
        }
    }
}

extension TheUIViewControllerRepresentable: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.userInterface], version: .iOS14)
    }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    static let instance = TheUIViewControllerRepresentable()
}

#Preview {
    TheUIViewControllerRepresentable()
}

struct MyView: UIViewControllerRepresentable {
    typealias UIViewControllerType = PresentSwiftUIViewController

    func makeUIViewController(context: Context) -> PresentSwiftUIViewController {
        PresentSwiftUIViewController()
    }

    func updateUIViewController(_ uiViewController: PresentSwiftUIViewController, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
    }
}
