//
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//

import Foundation

class MovieListRetryViewModel {
    private let onTap: () -> Void
    let title: String = "try again"

    init(onTap: @escaping () -> Void) {
        self.onTap = onTap
    }

    func tap() {
        onTap()
    }
}
