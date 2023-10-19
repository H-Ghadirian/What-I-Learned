import SwiftUI

struct SheetNavigation: View {
    enum Sheet: String, Identifiable {
        case addArticle, hapticTest, asyncAwaitRequest
        var id: String { rawValue }
    }

    @State var presentedSheet: Sheet?

    var body: some View {
        listOfButtonToPresentSheet
    }

    var listOfButtonToPresentSheet: some View {
        VStack {
            Button("Add Article") {
                presentedSheet = .addArticle
            }
            Button("Test Haptic") {
                presentedSheet = .hapticTest
            }
            Button("Article Category") {
                presentedSheet = .asyncAwaitRequest
            }
        }
        .sheet(item: $presentedSheet, content: { sheet in
            switch sheet {
            case .addArticle:
                if #available(iOS 16.0, *) {
                    TestSheets()
                } else {
                    // Fallback on earlier versions
                }
            case .hapticTest:
                HapticTestView()
            case .asyncAwaitRequest:
                AsyncAwaitRequest()
            }
        })
        .padding()
        .frame(width: 400, height: 300)
    }
}

extension SheetNavigation: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS14)
    }

    static func project() -> any ProjectProtocol {
        instance
    }
    static func run() -> AnyView {
        AnyView(instance)
    }
    private static let instance = SheetNavigation()
}
