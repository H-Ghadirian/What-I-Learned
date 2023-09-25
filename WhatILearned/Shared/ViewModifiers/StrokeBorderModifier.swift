import Foundation
import SwiftUI

struct StrokeBorderModifier: ViewModifier {
    var lineWidth: CGFloat
    var strokeColor: Color

    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(strokeColor, lineWidth: lineWidth)
            )
    }
}

extension View {
    func withStrokeBorder(lineWidth: CGFloat = 1, strokeColor: Color = .primary) -> some View {
        self.modifier(StrokeBorderModifier(lineWidth: lineWidth, strokeColor: strokeColor))
    }
}
