//
//  ContentView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 15.02.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationLink(
                value: "I've Navigated",
                label: { Text("Test Navigating") }
            )
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("This is my resume App")
            Text("This app is all about what I learned!")
            Text("You can find the code on")
            Link("My Github", destination: URL(string: "https://github.com/H-Ghadirian/What-I-Learned")!)

        }
        .padding()
        // Add the destnation here
        .navigationDestination(for: String.self) {
            Text($0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
