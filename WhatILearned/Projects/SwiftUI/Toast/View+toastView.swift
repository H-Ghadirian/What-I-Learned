import Foundation
import SwiftUI

extension View {
    func toastView(toast: Binding<FancyToast?>) -> some View {
        self.modifier(FancyToastModifier(toast: toast))
    }

    func toastView(toast: Binding<SimpleToast?>) -> some View {
        self.modifier(SimpleToastModifier(toast: toast))
    }
}
