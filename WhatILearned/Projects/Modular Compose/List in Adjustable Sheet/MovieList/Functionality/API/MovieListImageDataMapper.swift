//
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//

import Foundation
enum MovieListImageDataMapper {

    static func map(data: Data, from response: HTTPURLResponse) throws -> Data {
        guard response.statusCode == 200, !data.isEmpty else {
            throw RemoteMovieListImageDataLoader.Error.invalidData
        }

        return data
    }
}
