import Charts
import SwiftUI

enum ShapeColor: String, CaseIterable, ChartDescribable {
    case green = "💚", blue = "💙", purple = "💜", orange = "🧡"
    
    var color: Color {
        switch self {
        case .green:
            return .green
        case .blue:
            return .blue
        case .purple:
            return .purple
        case .orange:
            return .orange
        }
    }

    static var description = "Colors"
}
