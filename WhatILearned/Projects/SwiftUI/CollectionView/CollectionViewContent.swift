import SwiftUI

struct DataModel: Identifiable {
    let id: String
    let name: String
    let imageName: String
}

struct CollectionViewContent: View {
    let data: [DataModel] = [
        .init(id: "0", name: "SteveJobs", imageName: "pencil.and.outline"),
        .init(id: "1", name: "Satya Nadella", imageName: "signature"),
        .init(id: "2", name: "Jeff Bezos", imageName: "bolt.circle.fill"),
        .init(id: "3", name: "Tim Cook", imageName: "bolt.fill")
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(data) { items in
                    ForEach(0..<2) { item in
                        CollectionView(data: items)
                    }
                }
            }.navigationBarTitle("CollectionView")
        }
    }
}

extension CollectionViewContent: ProjectProtocol {
    var tags: [Tag] { [.swiftui] }

    var version: IOSVersionTag { .iOS14 }

    static private let instance = CollectionViewContent()
    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}

struct CollectionView: View {
    let data: DataModel

    var body: some View {
        VStack {
            HStack {
                ForEach(0..<2) { items in
                    Spacer()
                    Image(systemName: data.imageName)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.yellow)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                    Spacer()
                }.padding(.bottom, 16)
            }
            HStack {
                Spacer()
                Text(self.data.name)
                Spacer()
                Text(self.data.name)
                Spacer()
            }
        }
    }
}

struct CollectionViewContent_Previews: PreviewProvider {
    static var previews: some View {
        CollectionViewContent().environment(\.colorScheme, .light)
    }
}
