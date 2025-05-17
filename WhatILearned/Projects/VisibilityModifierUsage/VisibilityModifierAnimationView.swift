import SwiftUI

struct VisibilityModifierAnimationView: View {
    @State private var isVisible = false
    @State private var isDisplaying = false

    var body: some View {
        VStack {
            Text("🔎 Watch me")
                .padding()
                .background(isVisible ? Color.green.opacity(0.5) : Color.red.opacity(0.5))
                .modifier(
                    VisibilityModifier(
                        visibilityUpdated: { visible in
                            print("visibilityUpdated : \(visible)")
                            isVisible = visible
                        },
                        displayingUpdated: { displaying in
                            print("displayingUpdated : \(displaying)")
                            isDisplaying = displaying
                        }
                    )
                )

            Text("Visible: \(isVisible.description)")
            Text("Displaying overlay: \(isDisplaying.description)")
        }
        .animation(.default, value: isVisible)
    }
}
#Preview {
    VisibilityModifierAnimationView()
}

extension VisibilityModifierAnimationView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS16)
    }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    static var instance = VisibilityModifierAnimationView()
}
