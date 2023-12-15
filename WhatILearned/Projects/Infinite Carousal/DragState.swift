//
//  DragState.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 15.12.23.
//

import Foundation
import SwiftUI

enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}
