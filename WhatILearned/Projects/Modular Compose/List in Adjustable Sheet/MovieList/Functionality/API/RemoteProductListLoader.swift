//
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//
import Foundation

public class RemoteProductListLoader: MovieListLoader {
    private let baseURL: URL
    private let client: MovieListHTTPClient

    public typealias Result = MovieListLoader.Result

    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }

    public init(baseURL: URL, client: MovieListHTTPClient) {
        self.baseURL = baseURL
        self.client = client
    }

    public func loadProducts(completion: @escaping (Result) -> Void) {
        client.dataTask(for: URLRequest(url: baseURL)) { [weak self] result in
            guard let self = self else { return }
            completion(
                result
                    .mapError { _ in Error.connectivity }
                    .flatMap { response in
                        do {
                            let products = try ProductListMapper.map(data: response.0, from: response.1)
                            return .success(products)
                        } catch {
                            return .failure(error)
                        }
                    }
            )
        }
    }
}
