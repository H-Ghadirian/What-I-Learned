import Foundation

enum MarkType: String, CaseIterable, ChartDescribable {
    case bar, point, line

    static var description = "Mark type"
}
