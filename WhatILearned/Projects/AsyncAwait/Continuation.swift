import Lottie
import SwiftUI

@available(iOS 15.0, *)
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

@available(iOS 15.0, *)
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

@available(iOS 15.0, *)
extension ContinuationContentView: ProjectProtocol {
    var tags: [Tag] {
        [.functionality]
    }

    var version: IOSVersionTag {
        .iOS15
    }
    
    private static let instance = ContinuationContentView()

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}

@available(iOS 15.0, *)
struct ContinuationContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContinuationContentView()
    }
}
