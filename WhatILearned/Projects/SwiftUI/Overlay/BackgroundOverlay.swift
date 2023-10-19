import SwiftUI

@available(iOS 17.0, *)
struct BackgroundOverlayView: View {

    @State private var currentScaleAmount = 0.0
    @State private var finalScaleAmount = 1.0

    @State private var currentRotationAmount = Angle.zero
    @State private var finalRotationAmount = Angle.zero

    var body: some View {
        VStack {
            Text("Hamed")
                .foregroundStyle(.red)
                .overlay {
                    Circle()
                        .fill(.blue.opacity(0.9))
                        .frame(width: 100, height: 100)
                        .onTapGesture(count: 2) {
                            print("Double tapped!")
                        }
                        .onLongPressGesture(minimumDuration: 1) {
                            print("Long pressed with minimumDuration!")
                        }
                }
            Spacer()
                .frame(height: 100)
            Text("Hamed")
                .foregroundStyle(.red)
                .background {
                    Circle()
                        .fill(.blue.opacity(0.9))
                        .frame(width: 100, height: 100)
                        .onLongPressGesture {
                            print("Long pressed!")
                        }
                }
            Spacer()
                .frame(height: 100)
            Image(systemName: "square.and.arrow.up")
                .background {
                    Circle().fill(.green.opacity(0.5))
                        .frame(width: 100, height: 100)
                }

            Spacer()
                .frame(height: 100)
            Text("Hello, World!")
        }
        .rotationEffect(currentRotationAmount + finalRotationAmount)
        .simultaneousGesture(
            RotationGesture()
                .onChanged { angle in
                    currentRotationAmount = angle
                }
                .onEnded { angle in
                    finalRotationAmount += currentRotationAmount
                    currentRotationAmount = .zero
                }
        )
        .scaleEffect(finalScaleAmount + currentScaleAmount)
        .simultaneousGesture(
            MagnificationGesture()
                .onChanged { amount in
                    currentScaleAmount = amount - 1
                }
                .onEnded { amount in
                    finalScaleAmount += currentScaleAmount
                    currentScaleAmount = 0
                }
        )
    }
}

@available(iOS 17.0, *)
extension BackgroundOverlayView: ProjectProtocol {
    var tags: ProjectTags {
        ProjectTags(
            tags: [.ui],
            version: .iOS17
        )
    }

    static private let instance = BackgroundOverlayView()
    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}

@available(iOS 17.0, *)
struct BackgroundOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundOverlayView()
            .border(.red)
    }
}
