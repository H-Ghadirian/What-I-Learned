//
//  SettingTab.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 04.08.23.
//

import SwiftUI

struct SettingTab: View {
    @AppStorage("systemThemeVal") private var systemTheme: Int = SchemeType.allCases.first!.rawValue
    @State private var showingFirst = false
    @State private var showingSecond = false
    enum Sheet: String, Identifiable {
        case addArticle, editArticle, articleCategory
        var id: String { rawValue }
    }

    @State var presentedSheet: Sheet?

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
                "Source Code(Github)",
                destination: URL(
                    string: "https://github.com/H-Ghadirian/What-I-Learned"
                )!
            )
            listOfButtonToPresentSheet
            buttonToPresentSheet
        }
        .padding()
        .tabItem {
            Image(systemName: "gear")
            Text("Setting")
        }
        .tag(2)
        .preferredColorScheme(selectedScheme)
    }
    
    var listOfButtonToPresentSheet: some View {
        VStack {
            Button("Add Article") {
                presentedSheet = .addArticle
            }
            Button("Edit Article") {
                presentedSheet = .editArticle
            }
            Button("Article Category") {
                presentedSheet = .articleCategory
            }
        }
        .sheet(item: $presentedSheet, content: { sheet in
            switch sheet {
            case .addArticle:
                AddArticleView()
            case .editArticle:
                Text("EditArticleView()")
            case .articleCategory:
                Text("ArticleCategoryView()")
            }
        })
        .padding()
        .frame(width: 400, height: 300)
    }

    var buttonToPresentSheet: some View {
        VStack {
            Button("Show First Sheet") {
                showingFirst = true
            }
        }
        .sheet(isPresented: $showingFirst) {
            Button("Show Second Sheet") {
                showingSecond = true
            }
            .sheet(isPresented: $showingSecond) {
                AddArticleView()
            }
        }
    }
}

struct AddArticleView: View {
    @Environment(\.dismiss) private var dismiss

    @State var title: String = ""

    var body: some View {
        VStack(spacing: 10) {
            Text("Add a new article")
                .font(.title)
            TextField(text: $title, prompt: Text("Title of the article")) {
                Text("Title")
            }

            HStack {
                Button("Cancel") {
                    dismiss()
                }
                Spacer()
                Button("Confirm") {
                    dismiss()
                }
            }
        }
        .padding(20)
        .frame(width: 300, height: 200)
    }
}
