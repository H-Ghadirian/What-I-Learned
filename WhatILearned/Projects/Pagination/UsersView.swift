import Foundation
import SwiftUI

struct UsersView: View {

    @StateObject var usersVM = UsersViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(usersVM.users, id: \.self) { user in
                        UserView(user: user)
                            .onAppear {
                                usersVM.loadMoreContent(currentItem: user)
                            }
                    }
                }
            }
            .navigationTitle("Users")
        }
    }
}

extension UsersView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.functionality], version: .iOS14)
    }

    private static let instance = UsersView()

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}
