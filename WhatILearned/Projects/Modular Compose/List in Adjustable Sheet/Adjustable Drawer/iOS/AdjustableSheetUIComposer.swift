//
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//

import Foundation
import SwiftUI

public enum AdjustableSheetUIComposer {

    private static var bottomInset: CGFloat {
        UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0.0
    }

    public static func createView() -> some View {
        let client = URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
        let view = AdjustableSheetUIComposer.composedWith(
            baseURL: URL(string: "https://www.pointfree.co/")!,
            client: client
        ) { item in
            print(item.id)
        } dismiss: {
            print("dismiss")
        }
        return view
    }

    public static func composedWith(
        baseURL: URL,
        client: MovieListHTTPClient,
        selection: @escaping (MovieListItem) -> Void,
        dismiss: @escaping () -> Void
    ) -> AdjustableSheetView<MovieListView> {
        let loader = RemoteProductListLoader(baseURL: baseURL, client: client)
        let imageLoader = RemoteMovieListImageDataLoader(client: client)
        let contentView = MovieListUIComposer.composed(loader: loader, imageLoader: imageLoader, selection: selection)

        return makeSheet(title: "Sheet Title", initialHeight: 420 + bottomInset, content: contentView, dismiss: dismiss)
    }

    private static func makeSheet<Content: View>(
        title: String,
        initialHeight: CGFloat,
        content: Content,
        dismiss: @escaping () -> Void
    ) -> AdjustableSheetView<Content> {
        let viewModel = AdjustableSheetViewModel(title: title)
        let store = AdjustableSheetStore()
        let view = AdjustableSheetView(
            initialHeight: initialHeight,
            content: content,
            viewModel: viewModel,
            store: store
        )

        viewModel.dismiss = dismiss

        return view
    }
}
