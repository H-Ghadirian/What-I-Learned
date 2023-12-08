import Foundation
import SwiftData

@Model
class SwiftDataUser {
    var id: UUID
    var firstName: String
    var lastName: String
    var company: SwiftDataCompany

    init(firstName: String, lastName: String, company: SwiftDataCompany) {
        self.id = UUID()
        self.firstName = firstName
        self.lastName = lastName
        self.company = company
    }
}

@Model
class SwiftDataCompany {
    var id: UUID
    var companyName: String
    var designation: String

    init(companyName: String, designation: String) {
        self.id = UUID()
        self.companyName = companyName
        self.designation = designation
    }
}
