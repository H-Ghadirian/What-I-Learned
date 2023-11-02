import SwiftUI

public struct AsyncAwaitRequestView: View {

    let viewModel: AsyncAwaitRequestViewModel
    public init(viewModel: AsyncAwaitRequestViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        NavigationView {
            List(viewModel.messages) { message in
                VStack(alignment: .leading) {
                    Text(message.user)
                        .font(.headline)
                    Text(message.text)
                }
            }
            .navigationTitle("Inbox")
            .toolbar {
                Button(action: viewModel.refresh) {
                    Label("Refresh", systemImage: "arrow.clockwise")
                }
            }
            .onAppear(perform: viewModel.refresh)
        }
    }
}

extension AsyncAwaitRequestView: ProjectProtocol {
    public var id: UUID { UUID() }
    var tags: ProjectTags {
        .init(tags: [.networking], version: .iOS14)
    }

    private static let instance = AsyncAwaitRequestView(viewModel: AsyncAwaitRequestViewModel())

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}

#Preview {
    AsyncAwaitRequestView(viewModel: AsyncAwaitRequestViewModel())
}
