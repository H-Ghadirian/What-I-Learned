import Foundation

struct Message: Decodable, Identifiable {
    let id: Int
    let user: String
    let text: String
}
