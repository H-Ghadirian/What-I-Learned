//
//  PressButtonStateStore.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 17.11.23.
//

import Foundation
import SwiftUI

public class PressButtonStateStore: ObservableObject {
    @Published var value: PressButtonState

    public init(_ value: PressButtonState) {
        self.value = value
    }
}
