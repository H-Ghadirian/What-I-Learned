//
//  MenuView.swift
//  WhatILearned
//
//  Created by Paul, Arup, HSE DE on 20.07.23.
//

import Foundation
import SwiftUI

struct MenuView<ViewModel: MenuViewModelProtocol>: View {
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            List {
                ForEach(viewModel.menus, id: \.id) { section in
                    Section {
                        ForEach(section.items, id: \.id) { item in
                            HStack {
                                Image(systemName: "chevron.right")
                                Text(item.name)
                            }.onTapGesture {
                                viewModel.goto(item)
                            }
                        }
                    } header: {
                        Text(section.name)
                    }
                }
            }
        }
    }
}
