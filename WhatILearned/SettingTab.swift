//
//  SettingTab.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 04.08.23.
//

import SwiftUI

struct SettingTab: View {
    @AppStorage("systemThemeVal") private var systemTheme: Int = SchemeType.allCases.first!.rawValue

    var selectedScheme: ColorScheme? {
        guard let theme = SchemeType(rawValue: systemTheme) else { return nil }
        switch theme {
        case .light:
            return .light
        case .dark:
            return .dark
        default:
            return nil
        }
    }

    var body: some View {
        VStack {
//            NavigationLink(destination: {
//                Text("Second View")
//                    .navigationTitle("Second")
//                    .navigationBarTitleDisplayMode(.inline)
//            }, label: {
//                Text("Open Second View!")
//            })

            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)

            Picker(selection: $systemTheme) {
                ForEach(SchemeType.allCases) { item in
                    Text(item.title)
                        .tag(item.rawValue)
                }
            } label: {
                Text("Pick a mode")
            }

            Text("This app is all about what I learned!")
            Text("You can find the code on")
            Link(
                "My Github",
                destination: URL(
                    string: "https://github.com/H-Ghadirian/What-I-Learned"
                )!
            )
        }
        .padding()
        .tabItem {
            Image(systemName: "2.circle")
            Text("Setting")
        }
        .tag(2)
        .preferredColorScheme(selectedScheme)
    }
}
