//
//  ContentView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 15.02.23.
//

 import SwiftUI

@available(iOS 16.0, *)
struct SecondJsonMenuListView: View {

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
                ForEach(menu) { section in
                    Text(section.name)
                        .bold()
                    ForEach(section.items) { item in
                        Text(item.name)
                            .padding()
                            .background(.yellow)
                    }
                }
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

@available(iOS 16.0, *)
extension SecondJsonMenuListView: ProjectProtocol {
    var tags: [Tag] { [.ui] }

    var version: IOSVersionTag { .iOS16 }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    private static let instance = SecondJsonMenuListView()
}

@available(iOS 16.0, *)
struct SecondJsonMenuListView_Previews: PreviewProvider {
    static var previews: some View {
        SecondJsonMenuListView()
    }
}
