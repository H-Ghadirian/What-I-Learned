import Foundation
import SwiftUI

struct ToastViewExample: View {
    @State private var fancyToast: FancyToast?
    @State private var simpleToast: SimpleToast?

    var body: some View {
        VStack(spacing: 20) {
            Button {
                fancyToast = FancyToast(type: .info, title: "Toast info", message: "Toast message")
            } label: {
                Text("Fancy Toast")
            }

            Button {
                simpleToast = SimpleToast(message: "Lorem ipsum dolor sit amet, adipiscing elit. ")
            } label: {
                Text("Simple Toast")
            }
        }
        .toastView(toast: $fancyToast)
        .toastView(toast: $simpleToast)
    }
}

extension ToastViewExample: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.userInterface], version: .iOS14)
    }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    static let instance = ToastViewExample()
}
