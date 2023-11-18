//
//  ViewObserverStore.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 18.11.23.
//

import Foundation
import SwiftUI

class ViewObserverStore<T>: ObservableObject {
    @Published private(set) var value: T

    init(_ value: T) {
        self.value = value
    }

    func fetch(_ value: T) {
        self.value = value
    }
}
