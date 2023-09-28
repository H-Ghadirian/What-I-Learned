import Foundation
import SwiftUI

struct SearchableListView: View {
    let projects: [Projects] = Projects.allCases

    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults.indices, id: \.self) { index in
                    NavigationLink {
                        projects[index].view
                    } label: {
                        Text("\(index + 1) -" + projects[index].name)
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
