import SwiftUI

public struct VisibilityModifier: ViewModifier {
    private let visibilityUpdated: (Bool) -> Void
    private let displayingUpdated: (Bool) -> Void

    init(
        visibilityUpdated: @escaping (Bool) -> Void,
        displayingUpdated: @escaping (Bool) -> Void
    ) {
        self.visibilityUpdated = visibilityUpdated
        self.displayingUpdated = displayingUpdated
    }

    public func body(content: Content) -> some View {
        content
            .overlay {
                LazyHStack {
                    Color.clear
                        .frame(width: 10, height: 10)
                        .onAppear {
                            visibilityUpdated(true)
                        }
                        .onDisappear {
                            visibilityUpdated(false)
                        }
                }
                .onAppear {
                    displayingUpdated(true)
                }
                .onDisappear {
                    displayingUpdated(false)
                }
            }
    }
}
