import Foundation

struct Article: Identifiable, Hashable {
    let id = UUID()

    let title: String
    let author: String
}

extension Article {
    static let examples: [Article] = [
        .init(title: "Making 5 Apps in 1 Hour", author: "Flo writes Code"),
        .init(title: "Combine Mastery", author: "BigMountainStudio"),
        .init(title: "Dad Jokes", author: "Stewart Lynch")
    ]
}
