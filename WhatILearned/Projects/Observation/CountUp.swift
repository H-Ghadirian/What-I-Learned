//
//  CountUp.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 08.05.24.
//

import SwiftUI
import Observation

@available(iOS 17.0, *)
struct CountUp: View {
    @State var viewModel = ViewModel()

    var body: some View {
        VStack {
            Text(viewModel.count.description)
            Button("Next") {
                viewModel.increaseCount()
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    CountUp()
}

@available(iOS 17.0, *)
@Observable
class ViewModel {
    private(set) var count = 0

    func increaseCount() {
        count += 1
    }
}
