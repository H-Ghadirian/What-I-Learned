import Foundation

enum AppTabItem: String, Hashable, Identifiable, CaseIterable {
    var id: String {
        self.rawValue
    }
    case menu
    case profile
}
