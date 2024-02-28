//
//  TheMemoryLeakUIViewControllerRepresentable.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 27.02.24.
//
import SwiftUI
import UIKit

struct TheMemoryLeakUIViewControllerRepresentable: View {
    @State var isPresented = false

    var body: some View {
        VStack {
            Text("Is using [weak self] always required when working with closures?")
            Button("Present a ViewController") {
                isPresented = true
            }
            .sheet(isPresented: $isPresented) {
                TheMemoryLeakVCRepresentable()
            }
        }
    }
}

extension TheMemoryLeakUIViewControllerRepresentable: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.userInterface], version: .iOS14)
    }

    var link: URL? {
        URL(string: "https://www.swiftbysundell.com/questions/is-weak-self-always-required/")
    }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    static let instance = TheMemoryLeakUIViewControllerRepresentable()
}

#Preview {
    TheMemoryLeakUIViewControllerRepresentable()
}

struct TheMemoryLeakVCRepresentable: UIViewControllerRepresentable {
//    typealias UIViewControllerType = PresentSwiftUIViewController

    func makeUIViewController(context: Context) -> MemoryLeakViewController {
        MemoryLeakViewController()
    }

    func updateUIViewController(_ uiViewController: MemoryLeakViewController, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
    }
}
