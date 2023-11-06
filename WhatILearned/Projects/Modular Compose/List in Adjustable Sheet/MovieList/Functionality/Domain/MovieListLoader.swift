//
//  MovieListLoader.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//

import Foundation

public protocol MovieListLoader {
    typealias Result = Swift.Result<[MovieListItem], Error>
    func loadProducts(completion: @escaping (Result) -> Void)
}
