import Foundation
import SwiftUI

struct SearchableListView: View {
    let projects: [Projects] = Projects.allCases

    @State private var searchText = ""
    @State private var showHalfSheet: Bool = false

    var body: some View {
        NavigationStack {
            Button {
                showHalfSheet = true
            } label: {
                Text("Select Tags")
            }
            .sheet(isPresented: $showHalfSheet) {
                Text("Content")
                    .presentationDetents([.height(200), .medium, .large])
                    .presentationDragIndicator(.automatic)
            }
            .font(.title).bold()
            List {
                ForEach(searchResults.indices, id: \.self) { index in
                    NavigationLink {
                        projects[index].view
                    } label: {
                        Text("\(index + 1) -" + projects[index].name)
                    }
                }
            }
            .navigationTitle("Projects \(projects.count)")
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
