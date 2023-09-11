import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
    let loopMode: LottieLoopMode

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }

    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: "dancing")
        animationView.play()
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFit
        return animationView
    }
}

struct LottieContentView: View {
    var body: some View {
        LottieView(loopMode: .loop)
            .scaleEffect(0.4)
    }
}

struct LottieContentView_Previews: PreviewProvider {
    static var previews: some View {
        LottieContentView()
    }
}