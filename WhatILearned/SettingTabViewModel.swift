//
//  SettingTabViewModel.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 20.09.23.
//

import Foundation
import MyMacro

struct SettingTabViewModel {
    func printMyMacro() {
        let numberOne = 3
        let numberTwo = 2

        let (result, resultString) = #stringify(numberOne + numberTwo)

        print(resultString)
        print(result * 2)
    }
}
