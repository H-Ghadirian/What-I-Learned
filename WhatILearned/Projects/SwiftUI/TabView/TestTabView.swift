import SwiftUI

struct TestTabView: View {

    @State var selectedTab = 0

    var body: some View {
        TabView {
            Text("Hello World")
            Text("Hello World1")
            Text("Hello World2")
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

extension TestTabView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS14)
    }

    static private let instance = TestTabView()
    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}
struct TestTabView_Previews: PreviewProvider {
    static var previews: some View {
        TestTabView()
            .border(.red)
    }
}
