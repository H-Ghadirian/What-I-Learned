//
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//

import Foundation
import SwiftUI

public struct MovieListRetryView: View {
    private let viewModel: MovieListRetryViewModel

    init(viewModel: MovieListRetryViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        ZStack {
            Color(MovieListColors.background)
            VStack(alignment: .center, spacing: 8) {
                Image(systemName: "repeat")
                Text(viewModel.title)
                    .font(Font(MovieListFonts.messageText))
                    .foregroundColor(Color(MovieListColors.primaryText))
            }
        }
        .frame(height: 280)
        .onTapGesture(perform: viewModel.tap)
    }
}
