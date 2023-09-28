import SwiftUI

struct TestMacro: View, ProjectProtocol {
    private static let instance = TestMacro()
    static func run() -> AnyView {
        AnyView(instance)
    }

    static func project() -> any ProjectProtocol {
        instance
    }

    @State var resultNumber: Int = 0
    @State var resultString: String = ""

    let viewModel = MacroViewModel()

    var body: some View {
        VStack(spacing: 10) {
            Button("Calculate") {
                (resultNumber, resultString) = viewModel.printMyMacro()
            }
            Text(resultString)
            Text(String(resultNumber * 2))
        }
    }
}
