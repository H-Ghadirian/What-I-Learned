//
//  PressButtonViewModel.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 17.11.23.
//

import Foundation

class PressButtonViewModel {
    public typealias Observer = () -> Void
    public var onSubmitFeedback: Observer?

    let submitButtonTitle = "Press Me!"
    let reloadingIconName = "loadingArrow"
}
