import Foundation
import SwiftUI

struct ToastViewExample: View {
    @State private var toast: FancyToast?
    var body: some View {
        VStack {
            Button {
                toast = FancyToast(type: .info, title: "Toast info", message: "Toast message")
            } label: {
                Text("Run")
            }

        }
        .toastView(toast: $toast)
    }
}

extension ToastViewExample: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.ui], version: .iOS14)
    }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    static let instance = ToastViewExample()
}
