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
    }
    
    var body: some View {
        NavigationView {
            TabView {
                Text("First View")
                    .padding()
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("First")
                    }
                    .tag(1)
                secondTab
                    .padding()
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("Second")
                    }
                    .tag(2)
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
