import SwiftUI

struct HapticTestView: View {
    var body: some View {
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
