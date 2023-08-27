import Foundation
import SwiftUI

struct CoordinatorModifier<T: CoordinatorProtocol>: ViewModifier {
    @ObservedObject var coordinator: T

    func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                ForEach(coordinator.allPaths, id: \.id) { data in
                    withAnimation {
                        NavigationLink(
                            "",
                            tag: data.id,
                            selection: $coordinator.activePath
                        ) {
                            AnyView(coordinator.view(for: data))
                        }
                    }
                }
            }
            .offset(x: 100)
            .sheet(item: $coordinator.activeSheetPath) { _ in
                if let sheet = coordinator.activeSheetPath {
                    AnyView(coordinator.view(for: sheet))
                }
            }
        }
    }
}
