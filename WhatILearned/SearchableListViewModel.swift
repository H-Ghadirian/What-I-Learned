//
//  SearchableListViewModel.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 21.10.23.
//

import SwiftUI

struct SearchableListViewModel {
    let projects: [Projects] = Projects.allCases
    func iOSVersionOf(_ index: Int) -> Int {
        projects[index].iOSVersion.rawValue
    }
    var iOSVersion: Int { Int(Double(UIDevice.current.systemVersion) ?? 0) }
}
