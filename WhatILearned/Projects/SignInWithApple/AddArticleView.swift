import Foundation
import SwiftUI
import AuthenticationServices

@available(iOS 15.0, *)
struct AddArticleView: View {
    @Environment(\.dismiss) private var dismiss

    @State var title: String = ""

    var body: some View {
        VStack(spacing: 10) {
            Text("Add a new article")
                .font(.title)
            TextField(text: $title, prompt: Text("Title of the article")) {
                Text("Title")
            }

            SignInWithAppleButton(.signUp) { asAuthorizationAppleIDRequest in
                asAuthorizationAppleIDRequest.requestedScopes = [.fullName, .email]
            } onCompletion: { result in // Result<ASAuthorization, Error> in
                switch result {
                case .success(let authResult):
                    print("Auth success. Result: \(authResult)")
                    // Post-authentication updates on persistence and/or states.
                case .failure(let error):
                    print("Auth failed. Result: \(error.localizedDescription)")
                    // Handle auth failures
                }
            }
            .signInWithAppleButtonStyle(.black)

            HStack {
                Button("Cancel") {
                    dismiss()
                }
                Spacer()
                Button("Confirm") {
                    dismiss()
                }
            }
        }
        .padding(20)
        .frame(width: 300, height: 200)
    }

    private func showAppleLogin() {
      // 1
      let request = ASAuthorizationAppleIDProvider().createRequest()

      // 2
      request.requestedScopes = [.fullName, .email]

      // 3
        _ = ASAuthorizationController(authorizationRequests: [request])
    }

}

@available(iOS 15.0, *)
extension AddArticleView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.ui], version: .iOS15)
    }

    private static let instance = AddArticleView()

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}
