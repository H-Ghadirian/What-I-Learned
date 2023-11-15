//
//  RunLoopVsDispatchQueueViewModel.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 14.11.23.
//

import Foundation
import SwiftUI

class RunLoopVsDispatchQueueViewModel: ObservableObject {
    @Published var defaultTimer: Int = 0
    @Published var commonTimer: Int = 0

    init() {
        createDefaultTimer()
        createCommonTimer()
    }

    func createDefaultTimer() {
        let timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(increaseDefaultTimer),
            userInfo: nil,
            repeats: true
        )
        RunLoop.current.add(timer, forMode: .default)
    }

    @objc func increaseDefaultTimer() {
        defaultTimer += 1
    }

    func createCommonTimer() {
        let timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(increaseCommonTimer),
            userInfo: nil,
            repeats: true
        )
        RunLoop.current.add(timer, forMode: .common)
    }

    @objc func increaseCommonTimer() {
        commonTimer += 1
    }
}
