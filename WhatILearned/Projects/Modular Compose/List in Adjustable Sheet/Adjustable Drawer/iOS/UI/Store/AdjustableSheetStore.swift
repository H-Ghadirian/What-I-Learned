//
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//
import SwiftUI

class AdjustableSheetStore: ObservableObject {
    @Published var offset: CGFloat = 0
    @Published var lastOffset: CGFloat = 0
    @Published var globalOpacity: CGFloat = 0
}
