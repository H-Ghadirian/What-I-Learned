//
//  SearchableListViewModel.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 21.10.23.
//

import SwiftUI

class SearchableListViewModel {
    private var searchResultProjects: [any ProjectProtocol] = []
    private var projects: [any ProjectProtocol] = Projects.list

    var title: String { "Projects \(numberOfProjects)" }
    var numberOfProjects: Int { projects.count }
    var iOSVersion: Int {
        Int(
            Double(
                UIDevice.current.systemVersion.split(separator: ".").first ?? "0"
            ) ?? 0
        )
    }

    func iOSVersionOf(_ index: Int) -> Int {
        searchResultProjects[index].tags.version.rawValue
    }

    func presentationModeOf(project index: Int) -> PresentationMode {
        searchResultProjects[index].presentationMode
    }

    func colorOf(project index: Int) -> Color {
        switch searchResultProjects[index].tags.version {
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
        type(of: searchResultProjects[index]).run()
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
}
