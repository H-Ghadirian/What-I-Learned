//
//  ContentView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 15.02.23.
//

import SwiftUI

struct ContentView: View {
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
            Text("This is my resume App")
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
            Text("Second")
        }
        .tag(2)
    }

    private var firstTab: some View {
        NavigationStack {
            List {
                Text("First View")
            }
            .navigationTitle("Navigation title")
            .navigationBarTitleDisplayMode(.inline)
        }
        .tabItem {
            Image(systemName: "1.circle")
            Text("First")
        }
        .tag(1)
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
