import PhotosUI
import SwiftUI

@available(iOS 16.0, *)
struct PhotoPickerView: View {
    @State var wallpaper: PhotosPickerItem?
    @State private var image: Data?

    var body: some View {
        VStack {
            if let image = self.image,
               let image = UIImage(data: image) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            Spacer()
            PhotosPicker(selection: $wallpaper) {
                Label("Select a photo", systemImage: "photo")
            }.onChange(of: wallpaper) { newValue in
                Task {
                    if let image = try? await newValue?.loadTransferable(type: Data.self) {
                        self.image = image
                    }
                }
            }
        }
    }
}

@available(iOS 16.0, *)
extension PhotoPickerView: ProjectProtocol {
    var tags: [Tag] {
        [.ui, .library]
    }

    var version: IOSVersionTag {
        .iOS16
    }

    private static let instance = PhotoPickerView()

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}
