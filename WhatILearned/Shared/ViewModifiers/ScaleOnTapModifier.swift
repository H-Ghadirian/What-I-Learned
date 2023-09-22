import Foundation
import SwiftUI

struct ScaleOnTapModifier: ViewModifier {
    @State private var tapped: Bool = false
    var scaleAmount: CGFloat
    var resetDelay: TimeInterval

    init(scaleAmount: CGFloat, resetDelay: TimeInterval) {
        self.scaleAmount = scaleAmount
        self.resetDelay = resetDelay
    }

    func body(content: Content) -> some View {
        content
            .scaleEffect(tapped ? scaleAmount : 1)
            .onTapGesture {
                withAnimation {
                    self.tapped.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + resetDelay) {
                    withAnimation {
                        self.tapped = false
                    }
                }
            }
    }
}

extension View {
    func scaleOnTap(scaleAmount: CGFloat = 0.95, resetDelay: TimeInterval = 0.5) -> some View {
        self.modifier(ScaleOnTapModifier(scaleAmount: scaleAmount, resetDelay: resetDelay))
    }
}
