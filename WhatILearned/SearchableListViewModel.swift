//
//  SearchableListViewModel.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 21.10.23.
//

import SwiftUI

class SearchableListViewModel {
    private let altProjects: [any ProjectProtocol] = [TestMyViewModifiersView.instance]
    private let altSearchResultProjects: [any ProjectProtocol] = [TestMyViewModifiersView.instance]

    private let projects: [any ProjectProtocol] = [TestMyViewModifiersView.instance]
    private var searchResultProjects: [any ProjectProtocol] = [TestMyViewModifiersView.instance]

    var title: String { "Projects \(numberOfProjects)" }
    var numberOfProjects: Int { altProjects.count }

    func iOSVersionOf(_ index: Int) -> Int {
        altSearchResultProjects[index].tags.version.rawValue
    }

    func presentationModeOf(project index: Int) -> PresentationMode {
        altSearchResultProjects[index].presentationMode
    }
    func colorOf(project index: Int) -> Color {
        switch altSearchResultProjects[index].tags.version {
        case .iOS14:
            return .red
        case .iOS15:
            return .purple
        case .iOS16:
            return .green
        case .iOS17:
            return .yellow
        }
    }
    func viewOf(project index: Int) -> AnyView {
        type(of: altSearchResultProjects[index]).run()
//        AnyView(.mySelf)
//        searchResultProjects[index].view
    }
    func titleOf(project index: Int) -> String {
        "\(index + 1) - " + searchResultProjects[index].name
    }

    func getSearchResults(for text: String) -> [String] {
        if text.isEmpty {
            searchResultProjects = projects
        } else {
            searchResultProjects = projects.filter { $0.name.contains(text) }
        }
        return searchResultProjects.map { $0.name }
    }

    var iOSVersion: Int {
        Int(
            Double(
                UIDevice.current.systemVersion.split(separator: ".").first ?? "0"
            ) ?? 0
        )
    }
}
