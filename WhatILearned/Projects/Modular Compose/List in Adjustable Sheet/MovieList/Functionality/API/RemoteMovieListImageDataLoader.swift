//
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//

import Foundation

public class RemoteMovieListImageDataLoader: MovieListImageDataLoader {
    private let client: MovieListHTTPClient

    public typealias Result = MovieListImageDataLoader.Result

    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }

    public init(client: MovieListHTTPClient) {
        self.client = client
    }

    public func loadImageData(from url: URL, completion: @escaping (Result) -> Void) {
        client.dataTask(for: URLRequest(url: url)) { [weak self] result in
            guard self != nil else { return }
            completion(
                result
                    .mapError { _ in Error.connectivity }
                    .flatMap { data, response in
                        do {
                            return .success(try MovieListImageDataMapper.map(data: data, from: response))
                        } catch {
                            return .failure(error)
                        }
                    }
            )
        }
    }
}
