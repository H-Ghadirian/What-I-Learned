//
//  ProductListItemViewModel.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//

import Foundation

class MovieListItemViewModel {
    private let loader: MovieListImageDataLoader
    private let model: MovieListItem
    private let onTap: () -> Void
    private var loaded: Bool = false

    var loadedData: ((Data) -> Void)?

    var name: String { model.name }
    var price: String { formatted(price: model.price) }

    init(loader: MovieListImageDataLoader, model: MovieListItem, onTap: @escaping () -> Void) {
        self.loader = loader
        self.model = model
        self.onTap = onTap
    }

    func appear() {
        guard loaded == false else { return }
        loaded = true
        performLoading()
    }

    func tap() {
        onTap()
    }

    private func performLoading() {
        guard let image = model.image else { return }

        loader.loadImageData(from: image) { [weak self] result in
            if let imageData = try? result.get() {
                self?.loadedData?(imageData)
            }
        }
    }

    private func formatted(price: Float) -> String {
        String(format: "%.2f €", price).replacingOccurrences(of: ".", with: ",")
    }
}
