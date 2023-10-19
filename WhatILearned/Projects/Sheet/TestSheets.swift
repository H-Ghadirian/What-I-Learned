import SwiftUI

@available(iOS 16.0, *)
struct TestSheets: View {

    @State private var showHalfSheet: Bool = false
    @State private var isPresented = false

    var body: some View {
        VStack(spacing: 10) {
            Text("Hello ") + Text("World!")
            halfSheetButton
            fullScreenButton
        }
    }

    var halfSheetButton: some View {
        Button("Show Half Sheet") {
            showHalfSheet = true
        }
        .sheet(isPresented: $showHalfSheet) {
            ratingScreen
                .presentationDetents([.height(200), .medium, .large])
                .presentationDragIndicator(.automatic)
        }
        .font(.title).bold()
    }

    var ratingScreen: some View {
        VStack {
            List {
                ForEach(0..<100) { number in
                    Text("\(number)")
                }
            }
        }
    }

    var fullScreenButton: some View {
        Button("Present fullscreen cover!") {
            isPresented.toggle()
        }
        .fullScreenCover(isPresented: $isPresented, content: AddArticleView.init)
    }
}

@available(iOS 16.0, *)
extension TestSheets: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS16)
    }

    static func project() -> any ProjectProtocol {
        myView
    }
    static func run() -> AnyView {
        AnyView(myView)
    }
    private static let myView = TestSheets()
}
