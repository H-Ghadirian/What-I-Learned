import Lottie
import SwiftUI

class ContinuationViewModel {
    func fetchLatestNews(completion: @escaping ([String]) -> Void) {
        DispatchQueue.main.async {
            completion(["Swift 5.5 release", "Apple acquires Apollo"])
        }
    }

    func fetchLatestNews() async -> [String] {
        await withCheckedContinuation { continuation in
            fetchLatestNews { items in
                print("fetched")
                continuation.resume(returning: items)
            }
        }
    }
}

struct ContinuationContentView: View {
    @State private var messages = [String]()
    let viewModel = ContinuationViewModel()

    var body: some View {
        Text(messages.count.description)
            .task {
                messages = await viewModel.fetchLatestNews()
            }
    }
}

extension ContinuationContentView: ProjectProtocol {
    private static let instance = ContinuationContentView()

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}

struct ContinuationContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContinuationContentView()
    }
}
