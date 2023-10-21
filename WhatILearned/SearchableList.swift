import Foundation
import SwiftUI

@available(iOS 16.0, *)
struct SearchableListView: View {
    let viewModel = SearchableListViewModel()

    @State private var searchText = ""
    @State private var showHalfSheet: Bool = false
    @State private var modalSheet: Bool = false
    @State private var fullscreenModalSheet: Bool = false

    var body: some View {
        NavigationStack {
            selectTagsButton
            ScrollViewReader { scrollValue in
                ZStack(alignment: .bottomTrailing) {
                    listOfProjects
                    getScrollDownButton(scrollValue)
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

    private var listOfProjects: some View {
        List {
            ForEach(searchResults.indices, id: \.self) { index in
                switch viewModel.projects[index].presentationMode {
                case .modal(let isFullScreen):
                    if isFullScreen {
                        getButtonFullscreenSheet(index)
                    } else {
                        getButtonSheet(index)
                    }
                case .present:
                    getNavigationLink(index)
                }
            }
        }
    }

    private var selectTagsButton: some View {
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
    }

    private func getScrollDownButton(_ scrollValue: ScrollViewProxy) -> some View {
        Button {
            scrollValue.scrollTo(viewModel.projects.count - 1)
        } label: {
            Image(systemName: "arrow.down")
        }
    }

    private func getButtonSheet(_ index: Int) -> some View {
        Button {
            modalSheet = true
        } label: {
            getProjectTitleText(index)
                .foregroundStyle(viewModel.projects[index].color)
        }
        .sheet(isPresented: $modalSheet) {
            viewModel.projects[index].view
        }
    }

    private func getButtonFullscreenSheet(_ index: Int) -> some View {
        Button {
            fullscreenModalSheet = true
        } label: {
            getProjectTitleText(index)
                .foregroundStyle(viewModel.projects[index].color)
        }
        .fullScreenCover(isPresented: $fullscreenModalSheet) {
            viewModel.projects[index].view
        }
    }

    private func getNavigationLink(_ index: Int) -> some View {
        NavigationLink {
            if viewModel.iOSVersion >= viewModel.iOSVersionOf(index) {
                viewModel.projects[index].view
            } else {
                Text("Not support")
            }
        } label: {
            getProjectTitleText(index)
                .foregroundStyle(viewModel.projects[index].color)
        }
    }

    private func getProjectTitleText(_ index: Int) -> Text {
        Text("\(index + 1) -" + viewModel.projects[index].name)
    }

    private var searchResults: [Projects] {
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
