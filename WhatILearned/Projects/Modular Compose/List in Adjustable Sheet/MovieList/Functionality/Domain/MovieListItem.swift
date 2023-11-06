//
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//

import Foundation

public struct MovieListItem: Equatable {
    public let id: String
    public let image: URL?
    public let name: String
    public let price: Float

    public init(
        id: String,
        image: URL?,
        name: String,
        price: Float
    ) {
        self.id = id
        self.image = image
        self.name = name
        self.price = price
    }
}
