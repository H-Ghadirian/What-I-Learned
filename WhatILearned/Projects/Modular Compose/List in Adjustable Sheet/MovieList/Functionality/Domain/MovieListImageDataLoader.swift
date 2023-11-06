//
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//

import Foundation

public protocol MovieListImageDataLoader {
    typealias Result = Swift.Result<Data, Error>
    func loadImageData(from url: URL, completion: @escaping (Result) -> Void)
}
