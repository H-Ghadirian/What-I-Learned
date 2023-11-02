import SwiftUI

public enum AsyncAwaitRequestUIComposer {
    public static func composed() -> AsyncAwaitRequestView {
        AsyncAwaitRequestView(viewModel: AsyncAwaitRequestViewModel())
    }
}
