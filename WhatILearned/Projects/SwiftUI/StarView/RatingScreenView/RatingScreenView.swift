//
//  RatingScreenView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 21.10.23.
//

import SwiftUI

struct RatingScreenViewModel {
    var onRate: () -> Void = {}
    var ratingViewModel = RatingViewModel()
}

struct RatingScreenView: View {
    @State private var rate = 2

    private var viewModel: RatingScreenViewModel
    init(viewModel: RatingScreenViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Text("\(rate)")
            RatingView(
                viewModel: viewModel.ratingViewModel,
                rating: $rate
            )
            .frame(height: 100)
        }
    }
}

#Preview {
    RatingScreenView(
        viewModel: .init(
            onRate: {
            print("on rate 1")
        },
        ratingViewModel: .init(
            onRate: {
                print("on rate 2")
        }
        )
        )
        )
}
