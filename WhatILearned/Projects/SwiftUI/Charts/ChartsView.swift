import SwiftUI

@available(iOS 16.0, *)
struct ChartsView: View, ProjectProtocol {
    var tags: ProjectTags {
        ProjectTags(
            tags: [.userInterface],
            version: .iOS16
        )
    }

    static private let instance = ChartsView()
    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    // MARK: - UI

    private enum Constant {
        static let bottomPadding = 15.0
        static let horizontalPadding = 20.0
        static let stackSpacing = 10.0
        static let textColorOpacity = 0.7
    }

    // MARK: - Properties

    @StateObject var viewModel = ChartsViewModel()

    // MARK: - Body

    var body: some View {
        VStack(spacing: Constant.stackSpacing) {
            title
            ChartContainerView(viewModel: viewModel)
            ControlsView(viewModel: viewModel)
        }
        .padding(.horizontal, Constant.horizontalPadding)
    }

    var title: some View {
        Text(viewModel.title)
            .font(.title3)
            .foregroundColor(.black.opacity(Constant.textColorOpacity))
            .padding(.vertical, Constant.bottomPadding)
    }
}
