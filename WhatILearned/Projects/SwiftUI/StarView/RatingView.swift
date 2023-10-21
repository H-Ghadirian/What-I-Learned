//
//  RatingView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 20.10.23.
//

import Foundation
import SwiftUI

struct RatingViewModel {
    var onRate: () -> Void = {
        print("onRate")
    }
}

struct RatingView: View {
    @Binding var rating: Int
    private let startEmpty = Image(systemName: "star")
    private let starFill = Image(systemName: "star.fill")

    private let onColor = Color.gray
    private let offColor = Color.yellow
    private let viewModel: RatingViewModel
    init(viewModel: RatingViewModel, rating: Binding<Int>) {
        self.viewModel = viewModel
        self._rating = rating
    }

    var body: some View {
        HStack {
            ForEach(1..<6) { number in
                if number > rating {
                    startEmpty
                        .resizable()
                        .onTapGesture {
                            rating = number
                        }
                } else {
                    starFill
                        .resizable()
                        .onTapGesture {
                            rating = number
                        }
                }
            }
            .frame(width: 30, height: 30)
            .padding()
            .border(Color.black)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .accentColor(Color.black)
        .background(Color.pink)
    }
}

#Preview {
    RatingView(
        viewModel: RatingViewModel(),
        rating: .constant(2)
    )
}
