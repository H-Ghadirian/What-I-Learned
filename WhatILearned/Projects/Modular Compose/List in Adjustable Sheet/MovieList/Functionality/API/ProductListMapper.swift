//
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//

import Foundation

// swiftlint:disable identifier_name force_unwrapping
enum ProductListMapper {
    private static var validStatusCode: Int = 200

    static func map(data: Data, from response: HTTPURLResponse) throws -> [MovieListItem] {
        guard response.statusCode == validStatusCode, data.isEmpty == false else {
            throw RemoteProductListLoader.Error.invalidData
        }
        return listOfItems
    }

    private static var listOfItems: [MovieListItem] {
        [
            MovieListItem(
                id: "123",
                image: URL(
                    string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS52qqyY2Mosgxt-Pt00pZy4TqIhCanFTwyLwC-D0z5&s"
                ),
                name: "name",
                price: 23.0
            ),
            MovieListItem(
                id: "321",
                image: URL(string: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
                name: "name",
                price: 23.0
            ),
            MovieListItem(
                id: "123",
                image: URL(
                    string: "https://media.gcflearnfree.org/ctassets/topics/246/share_flower_fullsize.jpg"
                ),
                name: "name",
                price: 23.0
            ),
            MovieListItem(
                id: "321",
                image: URL(string: "https://statusneo.com/wp-content/uploads/2023/02/MicrosoftTeams-image551ad57e01403f080a9df51975ac40b6efba82553c323a742b42b1c71c1e45f1.jpg"),
                name: "name",
                price: 23.0
            )
        ]
    }
}
