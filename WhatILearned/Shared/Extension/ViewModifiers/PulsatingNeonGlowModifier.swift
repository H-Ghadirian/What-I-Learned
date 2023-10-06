import Foundation
import SwiftUI

struct PulsatingNeonGlowModifier: ViewModifier {
    @State private var isPulsating: Bool = false
    var pulseDuration: Double = 1.5
    var glowColor: Color = .blue

    func body(content: Content) -> some View {
        content
            .shadow(color: isPulsating ? glowColor : .clear, radius: isPulsating ? 8 : 0)
            .animation(
                Animation.easeInOut(duration: pulseDuration)
                    .repeatForever(autoreverses: true)
            )
            .onAppear {
                withAnimation {
                    self.isPulsating.toggle()
                }
            }
    }
}

extension View {
    func addPulsatingNeonGlow(pulseDuration: Double = 1.5, glowColor: Color = .blue) -> some View {
        self.modifier(PulsatingNeonGlowModifier(pulseDuration: pulseDuration, glowColor: glowColor))
    }
}
