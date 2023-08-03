//
//  ContentView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 15.02.23.
//

import SwiftUI

struct ContentView: View {
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

    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")

    private var secondTab: some View {
        VStack {
            NavigationLink(destination: {
                Text("Second View")
                    .navigationTitle("Second")
                    .navigationBarTitleDisplayMode(.inline)
            }, label: {
                Text("Open Second View!")
            })

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

    private var firstTab: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Text(section.name)
                        .bold()
                    ForEach(section.items) { item in
                        Text(item.name)
                            .padding()
                            .background(Colors.secondary)
                    }
                }
            }
            .navigationTitle("Navigation title")
            .navigationBarTitleDisplayMode(.inline)
        }
        .tabItem {
            Image(systemName: "1.circle")
            Text("Home")
        }
        .tag(1)
        .preferredColorScheme(selectedScheme)
    }

    var body: some View {
        NavigationView {
            TabView {
                firstTab
                secondTab
            }
            .navigationBarTitle("Hamed Resume")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
