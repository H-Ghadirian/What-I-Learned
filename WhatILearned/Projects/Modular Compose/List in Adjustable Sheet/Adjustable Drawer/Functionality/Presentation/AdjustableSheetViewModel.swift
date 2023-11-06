//
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//

import Foundation

class AdjustableSheetViewModel {
    var dismiss: (() -> Void)?
    let title: String

    init(title: String) {
        self.title = title
    }
}
