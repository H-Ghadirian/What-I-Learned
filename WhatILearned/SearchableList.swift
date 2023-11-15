import Foundation
import SwiftUI

@available(iOS 16.0, *)
struct SearchableListView: View {
    let viewModel = SearchableListViewModel()

    @State private var searchText = ""
    @State private var showHalfSheet: Bool = false
    @State private var modalSheet: [Bool] = [Bool](repeating: false, count: Projects.list.count)
    @State private var fullscreenModalSheet: [Bool] = [Bool](repeating: false, count: Projects.list.count)

    var body: some View {
        NavigationStack {
            selectTagsButton
            ScrollViewReader { scrollValue in
                ZStack(alignment: .bottomTrailing) {
                    listOfProjects
                    getScrollDownButton(scrollValue)
                }
            }
            .navigationTitle(viewModel.title)
        }
        .searchable(text: $searchText) {
            ForEach(viewModel.getSearchResults(for: searchText), id: \.self) { nameOfProject in
                Text(nameOfProject).searchCompletion(nameOfProject)
            }
        }
    }

    private var listOfProjects: some View {
        List {
            ForEach(viewModel.getSearchResults(for: searchText).indices, id: \.self) { index in
                switch viewModel.presentationModeOf(project: index) {
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
            scrollValue.scrollTo(viewModel.numberOfProjects - 1)
        } label: {
            Image(systemName: "arrow.down")
        }
    }

    private func getButtonSheet(_ index: Int) -> some View {
        Button {
            modalSheet[index] = true
        } label: {
            getProjectTitleText(index)
                .foregroundStyle(viewModel.colorOf(project: index))
        }
        .sheet(isPresented: $modalSheet[index]) {
            viewModel.viewOf(project: index)
        }
    }

    private func getButtonFullscreenSheet(_ index: Int) -> some View {
        print("Hamed Before Button: \(index)")
        return Button {
            fullscreenModalSheet[index] = true
        } label: {
            getProjectTitleText(index)
                .foregroundStyle(viewModel.colorOf(project: index))
        }
        .fullScreenCover(isPresented: $fullscreenModalSheet[index]) {
            print("Hamed fullScreenCover: \(index)")
            return viewModel.viewOf(project: index)
        }
    }

    private func getNavigationLink(_ index: Int) -> some View {
        NavigationLink {
            if viewModel.iOSVersion >= viewModel.iOSVersionOf(index) {
                viewModel.viewOf(project: index)
            } else {
                Text("Not support")
            }
        } label: {
            getProjectTitleText(index)
                .foregroundStyle(viewModel.colorOf(project: index))
        }
    }

    private func getProjectTitleText(_ index: Int) -> Text {
        Text(viewModel.titleOf(project: index))
    }
}
