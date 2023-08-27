import Foundation
import SwiftUI

public protocol CoordinatorProtocol: ObservableObject {
    associatedtype Path: Hashable & Identifiable
    var activePath: Path.ID? { get set }
    var activeSheetPath: Path? { get set }
    var allPaths: [Path] { get }
    func view(for state: Path) -> AnyView
    func start()
}
