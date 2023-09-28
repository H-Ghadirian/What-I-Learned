import SwiftUI

struct TestMacro: View {
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
