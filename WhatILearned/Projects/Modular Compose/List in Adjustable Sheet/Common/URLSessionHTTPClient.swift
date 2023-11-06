//
//  URLSessionHTTPClient.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 06.11.23.
//

import Foundation

class URLSessionHTTPClient: MovieListHTTPClient {

    private let session: URLSession

    private struct UnexpectedValuesRepresentation: Error {}

    public init(session: URLSession) {
        self.session = session
    }

    public func dataTask(for urlRequest: URLRequest, completion: @escaping (MovieListHTTPClient.Result) -> Void) {
        session.dataTask(with: urlRequest) { data, response, error in
            completion(Result {
                if let error = error {
                    throw error
                } else if let data = data, let response = response as? HTTPURLResponse {
                    return (data, response)
                } else {
                    throw UnexpectedValuesRepresentation()
                }
            }
            )
        }
        .resume()
    }
}
// TODO: remove it or create a mock!
// class MockURLSessionHTTPClient: ProductListHTTPClient {
//    func dataTask(for urlRequest: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
//
//    }
//    
// }
