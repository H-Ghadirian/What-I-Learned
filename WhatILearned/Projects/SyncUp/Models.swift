import Foundation
import IdentifiedCollections
import SwiftUI
import Tagged

@available(iOS 16.0, *)
struct SyncUp: Equatable, Identifiable, Codable {
    let id: Tagged<Self, UUID>
    var attendees: IdentifiedArrayOf<Attendee> = []
    var duration: Duration = .seconds(60 * 5)
    var meetings: IdentifiedArrayOf<Meeting> = []
    var theme: Theme = .bubblegum
    var title = ""
}

struct Attendee: Equatable, Identifiable, Codable {
    let id: Tagged<Self, UUID>
    var name = ""
}

struct Meeting: Equatable, Identifiable, Codable {
    let id: Tagged<Self, UUID>
    let date: Date
    var transcript: String
}

enum Theme: String, CaseIterable, Equatable, Identifiable, Codable {
    var id: Self { self }

    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow

    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan,
                .teal, .yellow:
            return .black
        case .indigo, .magenta, .navy, .oxblood, .purple:
            return .white
        }
    }

    var mainColor: Color { Color(rawValue) }

    var name: String { rawValue.capitalized }
}
