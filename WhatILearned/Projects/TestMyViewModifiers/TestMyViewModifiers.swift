//
//  TestMyViewModifiers.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 22.09.23.
//

import Foundation
import SwiftUI

struct TestMyViewModifiersView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large) // ViewModifier
                .foregroundColor(.accentColor) // ViewModifier
                .scaleOnTap(scaleAmount: 2)
            Text("Hello, world!")
                .withStrokeBorder(strokeColor: .black)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .withGradient(startColor: .blue, endColor: .green)
    }
}

struct TestMyViewModifiersView_Previews: PreviewProvider {
    static var previews: some View {
        TestMyViewModifiersView()
    }
}
