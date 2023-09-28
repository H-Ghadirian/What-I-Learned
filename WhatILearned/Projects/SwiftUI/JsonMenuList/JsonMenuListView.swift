import Foundation
import SwiftUI

struct JsonMenuListView: View, ProjectProtocol {
    static private let jsonMenuListView = JsonMenuListView()
    static func project() -> any ProjectProtocol {
        jsonMenuListView
    }

    static func run() -> AnyView {
        AnyView(jsonMenuListView)
    }

    @AppStorage("systemThemeVal") private var systemTheme: Int = SchemeType.allCases.first!.rawValue

    var selectedScheme: ColorScheme? {
        guard let theme = SchemeType(rawValue: systemTheme) else { return nil }
        switch theme {
        case .light:
            return .light
        case .dark:
            return .dark
        default:
            return nil
        }
    }

    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")

    private var firstTab: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Text(section.name)
                        .bold()
                    ForEach(section.items) { item in
                        Text(item.name)
                            .padding()
                            .background(Colors.secondary)
                    }
                }
            }
            .navigationTitle("Navigation title")
            .navigationBarTitleDisplayMode(.inline)
        }
        .tabItem {
            Image(systemName: "1.circle")
            Text("Home")
        }
        .tag(1)
        .preferredColorScheme(selectedScheme)
    }

    var body: some View {
        NavigationView {
            TabView {
                firstTab
            }
            .navigationBarTitle("Hamed Resume")
        }
    }
}

struct JsonMenuListView_Previews: PreviewProvider {
    static var previews: some View {
        JsonMenuListView()
    }
}
