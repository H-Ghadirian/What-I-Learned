//
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//

import Foundation

public protocol MovieListHTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    func dataTask(for urlRequest: URLRequest, completion: @escaping (MovieListHTTPClient.Result) -> Void)
}
