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
