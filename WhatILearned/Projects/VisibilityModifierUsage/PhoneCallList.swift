import SwiftUI

struct PhotoCell: View, Identifiable {
    internal let id: UUID = UUID()
    let url: URL
    @State private var image: UIImage?

    var body: some View {
        ZStack {
            if let img = image {
                Image(uiImage: img)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay {
                        Text("\(id.uuidString.prefix(4))")
                            .foregroundStyle(.white)
                            .background(.black)
                    }
            } else {
                Color.gray // placeholder
            }
        }
        .onVisibilityChanged(
            visibilityUpdated: { visible in
                print("PhotoCell visibilityUpdated \(visible) id: \(id)")
                if visible && image == nil {
                    loadImage()
                }
            }, displayingUpdated: { displaying in
                print("PhotoCell displayingUpdated \(displaying) id: \(id)")
            }
        )
        .frame(height: 200)
        .clipped()
    }

    private func loadImage() {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let uIImage = UIImage(data: data) {
                DispatchQueue.main.async { image = uIImage }
            }
        }.resume()
    }
}

struct GalleryView: View {
    private let urls: [URL] = [
        URL(string: "https://picsum.photos/id/10/200/200")!,
        URL(string: "https://picsum.photos/id/20/200/200")!,
        URL(string: "https://picsum.photos/id/30/200/200")!,
        URL(string: "https://picsum.photos/id/40/200/200")!,
        URL(string: "https://picsum.photos/id/50/200/200")!,
        URL(string: "https://picsum.photos/id/60/200/200")!,
        URL(string: "https://picsum.photos/id/70/200/200")!,
        URL(string: "https://picsum.photos/id/80/200/200")!,
        URL(string: "https://picsum.photos/id/90/200/200")!,
        URL(string: "https://picsum.photos/id/100/200/200")!
    ]

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(urls, id: \.self) { url in
                    PhotoCell(url: url)
                }
            }
        }
    }
}
#Preview {
    GalleryView()
}

extension GalleryView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS16)
    }
    var presentationMode: PresentationMode { .modal(isFullScreen: true) }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    static var instance = GalleryView()
}
