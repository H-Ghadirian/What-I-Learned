import Foundation

struct Person: Identifiable, Hashable {
    let id = UUID()

    let name: String
    let age: Int
}

extension Person {
    static let examples: [Person] = [
        .init(name: "Steve", age: 33),
        .init(name: "Maria", age: 14),
        .init(name: "Marta", age: 42),
        .init(name: "Peter", age: 9)
    ]
}
