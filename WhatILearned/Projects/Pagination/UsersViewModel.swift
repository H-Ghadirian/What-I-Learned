import Foundation
import SwiftUI
import Alamofire

class UsersViewModel: ObservableObject {

    @Published var users: [User] = []

    var totalPages = 0
    var page: Int = 1

    init() {
        getUsers()
    }

    func loadMoreContent(currentItem item: User) {
        let thresholdIndex = self.users.index(self.users.endIndex, offsetBy: -1)
        print("item.id: \(item.id), thresholdIndex: \(thresholdIndex), page: \(page), totalPages: \(totalPages)")
        if thresholdIndex == item.id, (page + 1) <= totalPages {
            page += 1
            print("load more..")
            getUsers()
        }
    }

    func getUsers() {
        let apiUrl = "https://reqres.in/api/users?page=\(page)"
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        AF.request(apiUrl).responseDecodable(of: Users.self, decoder: decoder) { [weak self] (response) in
            switch response.result {
                case .success(let users):
                    self?.totalPages = users.totalPages
                    self?.users.append(contentsOf: users.data)
                case .failure(let afError):
                    print("Error : \(afError)")
            }
        }
    }

}
