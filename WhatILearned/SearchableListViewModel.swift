//
//  SearchableListViewModel.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 21.10.23.
//

import SwiftUI

class SearchableListViewModel {
    private let projects: [Projects] = Projects.allCases
    private var searchResultProjects: [Projects] = Projects.allCases

    var title: String { "Projects \(numberOfProjects)" }
    var numberOfProjects: Int { projects.count }

    func iOSVersionOf(_ index: Int) -> Int {
        searchResultProjects[index].iOSVersion.rawValue
    }

    func presentationModeOf(project index: Int) -> PresentationMode {
        searchResultProjects[index].presentationMode
    }
    func colorOf(project index: Int) -> Color {
        searchResultProjects[index].color
    }
    func viewOf(project index: Int) -> AnyView {
        searchResultProjects[index].view
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
