import Foundation
import SwiftUI

public struct NavigatorView<C: CoordinatorProtocol, Content: View>: View {

    @ObservedObject private var coordinator: C
    private let contentBuilder: () -> Content
    public init(_ cord: C, @ViewBuilder content: @escaping () -> Content) {
        self.coordinator = cord
        contentBuilder = content
    }

    public var body: some View {
        NavigationView {
            ZStack {
                contentBuilder()
                    .coordinatorView(coordinator: coordinator)
            }
        }
    }
}

extension View {
    func coordinatorView<T: CoordinatorProtocol>(coordinator: T) -> some View {
        return self.modifier(CoordinatorModifier(coordinator: coordinator))
    }
}
