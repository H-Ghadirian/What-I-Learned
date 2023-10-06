import SwiftUI

struct Show: ViewModifier {
    let isVisible: Bool

    @ViewBuilder
    func body(content: Content) -> some View {
        if isVisible {
            content
        } else {
            content.hidden()
        }
    }
}

extension View {
    func show(isVisible: Bool = true) -> some View {
        self.modifier(Show(isVisible: isVisible))
    }
}
