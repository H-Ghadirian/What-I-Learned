import Foundation
import SwiftUI

struct GradientModifier: ViewModifier {
    var startColor: Color
    var endColor: Color

    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [startColor, endColor]
                    ),
                    startPoint: .topLeading, endPoint: .bottomTrailing
                )
            )
    }
}

extension View {
    func withGradient(startColor: Color, endColor: Color) -> some View {
        self.modifier(GradientModifier(startColor: startColor, endColor: endColor))
    }
}
