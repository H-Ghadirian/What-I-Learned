//
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//

import Foundation
import SwiftUI

public struct MovieListView: View {
    private let viewModel: MovieListViewModel
    @ObservedObject private var store: MovieListStore

    init(viewModel: MovieListViewModel, store: MovieListStore) {
        self.viewModel = viewModel
        self.store = store
    }

    public var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(store.productItemViews, id: \.id) { item in
                        item.view
                    }
                    ForEach(store.skeletonViews, id: \.id) { item in
                        item.view
                    }
                }
                .padding([.leading, .trailing], 15)
            }
            store.retryView
        }
        .padding([.top, .bottom], 16)
        .onAppear(perform: viewModel.appear)
    }
}
