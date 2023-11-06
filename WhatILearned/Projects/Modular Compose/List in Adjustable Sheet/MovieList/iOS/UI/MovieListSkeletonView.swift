import Foundation
import SwiftUI

public struct MovieListSkeletonView: View {

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            MovieListLoadingSkeletonView(content: { Color.clear })
                .frame(width: 160, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment: .leading, spacing: 4) {
                MovieListLoadingSkeletonView(content: { Color.clear })
                    .frame(width: 126, height: 11)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                MovieListLoadingSkeletonView(content: { Color.clear })
                    .frame(width: 126, height: 11)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                MovieListLoadingSkeletonView(content: { Color.clear })
                    .frame(width: 40, height: 11)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
            }
            .padding(4)
        }
    }
}

private struct MovieListLoadingSkeletonView<Content: View>: View {

    private let content: () -> Content
    @State private var startPoint: UnitPoint
    @State private var endPoint: UnitPoint
    private let gradientConfig = MovieListGradientConfig.default

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
        _startPoint = .init(wrappedValue: gradientConfig.initialLocation.start)
        _endPoint = .init(wrappedValue: gradientConfig.initialLocation.end)
    }

    var body: some View {
        ZStack {
            content()
            gradientConfig.backgroundColor
            LinearGradient(
                gradient: gradientConfig.shimmerLineGradient,
                startPoint: startPoint,
                endPoint: endPoint
            )
            .blendMode(.screen)
            .onAppear {
                withAnimation(Animation.linear(duration: gradientConfig.duration).repeatForever(autoreverses: false)) {
                    startPoint = gradientConfig.finalLocation.start
                    endPoint = gradientConfig.finalLocation.end
                }
            }
        }
    }
}

private struct MovieListGradientConfig {
    let shimmerLineGradient: Gradient
    let backgroundColor: Color
    let initialLocation: (start: UnitPoint, end: UnitPoint)
    let finalLocation: (start: UnitPoint, end: UnitPoint)
    let duration: TimeInterval

    public static let `default` = MovieListGradientConfig(
        shimmerLineGradient: Gradient(
            stops: [
                .init(color: .black, location: 0),
                .init(color: Color(red: 0.97, green: 0.97, blue: 0.97), location: 0.4),
                .init(color: Color(red: 0.97, green: 0.97, blue: 0.97), location: 0.6),
                .init(color: .black, location: 1)
            ]
        ),
        backgroundColor: Color(red: 0.92, green: 0.92, blue: 0.92),
        initialLocation: (start: UnitPoint(x: -2, y: 0.5), end: .leading),
        finalLocation: (start: .trailing, end: UnitPoint(x: 3, y: 0.5)),
        duration: 1.5
    )
}
