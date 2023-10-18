import Foundation
import SwiftUI

@available(iOS 16.0, *)
struct SearchableListView: View {
    let viewModel = SearchableListViewModel()

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
                Text("iOS \(viewModel.iOSVersion)")
                    .presentationDetents([.height(200), .medium, .large])
                    .presentationDragIndicator(.automatic)
            }
            .font(.title).bold()
            List {
                ForEach(searchResults.indices, id: \.self) { index in
                    NavigationLink {
                        viewModel.projects[index].view
                    } label: {
                        Text("\(index + 1) -" + viewModel.projects[index].name)
                            .foregroundStyle(viewModel.projects[index].color)
                    }
                }
            }
            .navigationTitle("Projects \(viewModel.projects.count)")
        }
        .searchable(text: $searchText) {
            ForEach(searchResults, id: \.self) { result in
                Text(result.name).searchCompletion(result.name)
            }
        }
    }

    var searchResults: [Projects] {
        if searchText.isEmpty {
            return viewModel.projects
//                .filter {
//                print($0.name + " \($0.iOSVersion)")
//                return $0.iOSVersion >= .iOS16
//            } // || $0.tags == [Tag.iOS16] }
        } else {
            return viewModel.projects.filter { $0.name.contains(searchText) }
        }
    }
}

struct SearchableListViewModel {
    let projects: [Projects] = Projects.allCases
    let iOSVersion = UIDevice.current.systemVersion
}
