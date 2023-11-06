import SwiftUI

public struct HapticTestView: View {

    public var body: some View {
        VStack(spacing: 10) {
            Button("light") {
                HapticFeedback().start(.light)
            }
            Button("medium") {
                HapticFeedback().start(.medium)
            }
            Button("heavy") {
                HapticFeedback().start(.heavy)
            }
            Button("success") {
                HapticFeedback().start(.success)
            }
            Button("error") {
                HapticFeedback().start(.error)
            }
            Button("warning") {
                HapticFeedback().start(.warning)
            }
        }
    }
}

extension HapticTestView: ProjectProtocol {
    public var id: UUID { UUID() }
    var tags: ProjectTags {
        ProjectTags(
            tags: [.functionality],
            version: .iOS14
        )
    }

    static private let instance = HapticTestView()
    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}
