//
//  MovieListViewModel.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//

import Foundation

public class MovieListViewModel {
    private let loader: MovieListLoader
    private var loaded: Bool = false

    var loadFailed: (() -> Void)?
    var loadedProductItems: (([MovieListItem]) -> Void)?

    init(loader: MovieListLoader) {
        self.loader = loader
    }

    func appear() {
        guard loaded == false else { return }
        loaded = true
        performLoading()
    }

    func retry() {
        performLoading()
    }

    private func performLoading() {
        loader.loadProducts() { [weak self] result in
            if let productItems = try? result.get() {
                self?.loadedProductItems?(productItems)
            } else {
                self?.loadFailed?()
            }
        }
    }
}
