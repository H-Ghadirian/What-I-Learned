//
//  ContentView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 15.02.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
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
            .navigationBarTitle("Hamed Resume")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
