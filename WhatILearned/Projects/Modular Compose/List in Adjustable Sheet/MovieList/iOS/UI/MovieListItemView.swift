//
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//

import Foundation
import SwiftUI

public struct MovieListItemView: View {
    private let viewModel: MovieListItemViewModel
    @ObservedObject var store: MovieListItemStore

    init(viewModel: MovieListItemViewModel, store: MovieListItemStore) {
        self.viewModel = viewModel
        self.store = store
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(uiImage: store.image)
                .resizable()
                .scaledToFill()
                .frame(width: 160, height: 200)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment: .leading, spacing: 4) {
                name
                price
            }
        }
        .frame(width: 160)
        .onAppear(perform: viewModel.appear)
        .onTapGesture(perform: viewModel.tap)
    }

    private var name: some View {
        Text(viewModel.name)
            .lineLimit(2)
            .foregroundColor(Color(MovieListColors.primaryText))
            .font(Font(MovieListFonts.primaryText))
    }

    private var price: some View {
        HStack(alignment: .center, spacing: 3) {
            Text(viewModel.price)
                .foregroundColor(Color(MovieListColors.primaryText))
                .font(Font(MovieListFonts.highlightedText))
        }
    }
}

private extension Text {
    init?(optionalText: String?) {
        guard let optionalText = optionalText else { return nil }
        self.init(optionalText)
    }
}
