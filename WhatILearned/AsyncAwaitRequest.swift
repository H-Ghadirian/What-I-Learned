import SwiftUI

struct AsyncAwaitRequest: View {
    let source = RemoteFile(url: URL(string: "https://hws.dev/inbox.json")!, type: [Message].self)
    @State private var messages = [Message]()

    var body: some View {
        NavigationView {
            List(messages) { message in
                VStack(alignment: .leading) {
                    Text(message.user)
                        .font(.headline)
                    Text(message.text)
                }
            }
            .navigationTitle("Inbox")
            .toolbar {
                Button(action: refresh) {
                    Label("Refresh", systemImage: "arrow.clockwise")
                }
            }
            .onAppear(perform: refresh)
        }
    }

    func refresh() {
        Task {
            do {
                // Access the property asynchronously
                messages = try await source.contents
            } catch {
                print("Message update failed.")
            }
        }
    }
}

extension AsyncAwaitRequest: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.networking], version: .iOS14)
    }

    private static let instance = AsyncAwaitRequest()

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}

#Preview {
    AsyncAwaitRequest()
}
