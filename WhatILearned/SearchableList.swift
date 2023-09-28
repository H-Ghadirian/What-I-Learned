import Foundation
import SwiftUI

struct SearchableListView: View {
    let projects: [Projects] = Projects.allCases

    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { project in
                    NavigationLink {
                        project.view
                    } label: {
                        Text(project.name)
                    }
                }
            }
            .navigationTitle("Contacts")
        }
        .searchable(text: $searchText) {
            ForEach(searchResults, id: \.self) { result in
                Text(result.name).searchCompletion(result.name)
            }
        }
    }

    var searchResults: [Projects] {
        if searchText.isEmpty {
            return projects
        } else {
            return projects.filter { $0.name.contains(searchText) }
        }
    }
}
