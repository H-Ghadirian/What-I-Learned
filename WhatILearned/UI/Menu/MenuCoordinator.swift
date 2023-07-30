//
//  MenuCoordinator.swift
//  WhatILearned
//
//  Created by Paul, Arup, HSE DE on 20.07.23.
//

import Foundation
import SwiftUI

class MenuCoordinator: CoordinatorProtocol {

    typealias Path = MenuItem

    @Published var activePath: Path.ID?
    
    @Published var activeSheetPath: MenuItem?
    
    var allPaths: [MenuItem]
    
    init(allPaths: [MenuItem]) {
        self.allPaths = allPaths
    }
    
    func view(for state: MenuItem) -> AnyView {
        return AnyView(Text("View for Item \(state.name)"))
    }
    
    func goto(_ path: MenuItem) {
        activePath = path.id
    }
    
    func start() {
        
    }
}
