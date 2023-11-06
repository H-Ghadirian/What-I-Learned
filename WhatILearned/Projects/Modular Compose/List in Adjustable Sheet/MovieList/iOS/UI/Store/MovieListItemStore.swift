//
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//

import Foundation
import SwiftUI

class MovieListItemStore: ObservableObject {
    @Published var image: UIImage = UIImage(named: MovieListImageNames.placeholder) ?? UIImage()
}
