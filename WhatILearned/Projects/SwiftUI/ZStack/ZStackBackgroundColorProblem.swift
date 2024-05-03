import SwiftUI

struct ZStackBackgroundColorProblem: View {
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("ZStack") // This view is under the notch
                    .font(.largeTitle)
                Text("Ignores Safe Area Edges")
                    .foregroundColor(.white)
                Image(ImageResource.pexels1)
                    .resizable()
                    .scaledToFit()
//                    .frame(width: 100,height: 100)

                Text(
                    """
                     Having the ZStack edges ignoring the safe area edges might be a mistake.
                     \nYou notice that the top Text view is completely under the notch.
                    """
                )
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                Spacer() // Added a spacer to push the views up.
            }
            .font(.title)
        }
//        .ignoresSafeArea()// (.all)
    }
}

@available(iOS 16.0, *)
extension ZStackBackgroundColorProblem: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS16)
    }

    static func project() -> any ProjectProtocol {
        myView
    }
    static func run() -> AnyView {
        AnyView(myView)
    }
    private static let myView = ZStackBackgroundColorProblem()
}

#Preview {
    ZStackBackgroundColorProblem()
}
