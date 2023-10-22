//
//  SearchableListViewModel.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 21.10.23.
//

import SwiftUI

struct SearchableListViewModel {
    let projects: [Projects] = Projects.allCases
    func iOSVersionOf(_ index: Int) -> Int {
        projects[index].iOSVersion.rawValue
    }

    var title: String { "Projects \(numberOfProjects)" }
    var numberOfProjects: Int { projects.count }
    func presentationModeOf(project index: Int) -> PresentationMode {
        projects[index].presentationMode
    }
    func colorOf(project index: Int) -> Color {
        projects[index].color
    }
    func viewOf(project index: Int) -> AnyView {
        projects[index].view
    }
    func titleOf(project index: Int) -> String {
        "\(index + 1) - " + projects[index].name
    }
    func getSearchResults(for text: String) -> [String] {
        if text.isEmpty {
            return projects.map { $0.name }
//                .filter {
//                print($0.name + " \($0.iOSVersion)")
//                return $0.iOSVersion >= .iOS16
//            } // || $0.tags == [Tag.iOS16] }
        } else {
            return projects.filter { $0.name.contains(text) }.map { $0.name }
        }
    }
    var iOSVersion: Int {
        Int(
            Double(
                UIDevice.current.systemVersion.split(separator: ".").first ?? "0"
            ) ?? 0
        )
    }
}
