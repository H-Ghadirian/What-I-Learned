import SwiftUI
// source: https://www.youtube.com/watch?v=7dnTHrLyFLc
@available(iOS 16.0, *)
struct ChrisNavigation: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("People") {
                    ForEach(Person.examples) { person in
                        NavigationLink(value: person) {
                            VStack(alignment: .leading) {
                                Text(person.name)

                                Text(person.age, format: .number)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }

                Section("Articles") {
                    ForEach(Article.examples) { article in
                        NavigationLink(value: article) {
                            VStack(alignment: .leading) {
                                Text(article.title)
                                    .font(.headline)

                                Text(article.author)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: Person.self) { person in
                Text(person.name)
                    .font(.headline)
            }
            .navigationDestination(for: Article.self) { article in
                VStack {
                    Text(article.title)

                    Button("Pop to root") {
                        path.removeLast(path.count)
                    }

                    Button("Navigate to person") {
                        path.append(Person.examples[1])
                        path.append(Person.examples[0])
                        path.append(Article.examples[0])
                    }
                }
            }
        }
    }
}

@available(iOS 16.0, *)
extension ChrisNavigation: ProjectProtocol {
    var tags: [Tag] {
        [.swiftui]
    }

    var version: IOSVersionTag {
        .iOS16
    }

    private static let instance = ChrisNavigation()

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}

@available(iOS 16.0, *)
struct ChrisNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ChrisNavigation()
    }
}
