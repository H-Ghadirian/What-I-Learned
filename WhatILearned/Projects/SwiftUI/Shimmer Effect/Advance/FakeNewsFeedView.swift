import Foundation
import SwiftUI

struct FakeNewsFeedView: View {

    @StateObject var viewModel = FakeNewsViewModel()
    var body: some View {
        VStack {
            Picker(selection: $viewModel.newsResult, label: EmptyView()) {
                ForEach(FakeNewsViewModel.NewsResult.allCases, id: \.rawValue) { result in
                    Text(result.description).tag(result)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            CollectionLoadingView(
                loadingState: viewModel.loadingState,
                content: FakeNewsList.init(items:),
                empty: {
                    MessageView(
                        message: "There are no news items",
                        imageName: "exclamationmark.bubble"
                    )
                },
                error: {
                    MessageView(
                        message: $0.localizedDescription,
                        imageName: "exclamationmark.triangle"
                    )
                    .foregroundColor(.red)
                }
            )
        }
        .onAppear { viewModel.reload() }
    }
}

extension FakeNewsFeedView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS14)
    }

    static let instance = FakeNewsFeedView()
    static func project() -> any ProjectProtocol {
        instance
    }
    
    static func run() -> AnyView {
        AnyView(instance)
    }
}
