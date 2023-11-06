//
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//

import Foundation
import SwiftUI

class MovieListStore: ObservableObject {
    struct Tile {
        let id = UUID()
        let view: MovieListItemView
    }

    struct SkeletonTile {
        let id = UUID()
        let view: MovieListSkeletonView
    }

    @Published var productItemViews: [Tile] = []
    @Published var skeletonViews: [SkeletonTile] = []
    @Published var retryView: MovieListRetryView?
}
