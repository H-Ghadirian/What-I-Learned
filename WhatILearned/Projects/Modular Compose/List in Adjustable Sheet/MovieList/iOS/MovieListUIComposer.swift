import Foundation
import SwiftUI
import UIKit

public enum MovieListUIComposer {
    public static func composed(
        loader: MovieListLoader,
        imageLoader: MovieListImageDataLoader,
        selection: @escaping (MovieListItem) -> Void
    ) -> MovieListView {
        let loader = MainQueueDispatchDecorator(decoratee: loader)
        let viewModel = MovieListViewModel(loader: loader)
        let store = MovieListStore()

        viewModel.loadFailed = { [weak store, weak viewModel] in
            let retryViewModel = MovieListRetryViewModel(onTap: { store?.retryView = nil; viewModel?.retry() })
            let retryView = MovieListRetryView(viewModel: retryViewModel)
            store?.skeletonViews = []
            store?.retryView = retryView
        }

        viewModel.loadedProductItems = { [weak store] products in
            store?.skeletonViews = []
            store?.productItemViews = products.map { product in
                let viewModel = MovieListItemViewModel(
                    loader: imageLoader,
                    model: product,
                    onTap: { selection(product) }
                )
                let listItemStore = MovieListItemStore()

                viewModel.loadedData = { [weak listItemStore] imageData in
                    guard let image = UIImage(data: imageData) else { return }
                    DispatchHandler.toMain { listItemStore?.image = image }
                }

                return MovieListStore.Tile(view: MovieListItemView(viewModel: viewModel, store: listItemStore))
            }
        }

        store.skeletonViews = Array(
            repeating: MovieListStore.SkeletonTile(view: MovieListSkeletonView()),
            count: 5
        )

        let view = MovieListView(viewModel: viewModel, store: store)

        return view
    }
}

private final class MainQueueDispatchDecorator<T> {
    private let decoratee: T

    init(decoratee: T) {
        self.decoratee = decoratee
    }

    func dispatch(completion: @escaping () -> Void) {
        guard Thread.isMainThread else {
            return DispatchQueue.main.async(execute: completion)
        }
        completion()
    }
}

extension MainQueueDispatchDecorator: MovieListLoader where T == MovieListLoader {
    func loadProducts(completion: @escaping (MovieListLoader.Result) -> Void) {
        decoratee.loadProducts { [weak self] result in
            self?.dispatch { completion(result) }
        }
    }
}

private enum DispatchHandler {
    static func toMain(_ work: @escaping () -> Void) {
        if Thread.isMainThread { work() } else { DispatchQueue.main.async(execute: work) }
    }
}
