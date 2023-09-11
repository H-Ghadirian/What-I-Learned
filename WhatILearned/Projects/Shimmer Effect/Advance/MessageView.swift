//
//  MessageView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 11.09.23.
//

import Foundation
import SwiftUI

struct MessageView: View {
    let message: String
    let imageName: String
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Image(systemName: imageName).font(.system(size: 48))
            Text(message)
            Spacer()
        }
    }
}
