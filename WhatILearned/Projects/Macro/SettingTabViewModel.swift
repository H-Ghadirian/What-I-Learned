//
//  SettingTabViewModel.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 20.09.23.
//

import Foundation
import MyMacro

struct MacroViewModel {
    func printMyMacro() -> (Int, String) {
        let numberOne = 3
        let numberTwo = 2

        return #stringify(numberOne + numberTwo)
    }
}
