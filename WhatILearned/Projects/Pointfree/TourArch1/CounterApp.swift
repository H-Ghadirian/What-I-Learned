import ComposableArchitecture
import SwiftUI
// 18:44
struct CounterFeature: Reducer {
    struct State: Equatable {
        var count = 0
        var fact: String?
        var isTimerOn = false
    }
    // name action litterally what user doing!
    // otherwise it will stale
    enum Action {
        case incrementButtonTapped
        case decrementButtonTapped
        case getFactButtonTapped
        case toggleButtonTimerTapped
    }
    // Reducer<State, Action>
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .incrementButtonTapped:
                state.count += 1
            case .decrementButtonTapped:
                state.count -= 1
            case .getFactButtonTapped:
                return .run { [count = state.count] send in
                    print(send)
                    let (data, response) = try await URLSession.shared.data(
                        from: URL(string: "http://numbersapi.com/\(count)")!
                    )
                    print(response)
                    let fact = String(data: data, encoding: .utf8)
                    print(fact ?? "data failed to convert")
                }
            case .toggleButtonTimerTapped:
                state.isTimerOn.toggle()
                // start timer
            }
            return .none
        }
    }
}

struct CounterAppView: View {
//    let store: Store<CounterFeature.State, CounterFeature.Action>
    let store: StoreOf<CounterFeature>

    var body: some View {
        WithViewStore(
            self.store,
            observe: {
                $0
            },
            content: { viewStore in
                Form {
                    Section {
                        Text("\(viewStore.count)")
                        Button("Decrement") {
                            viewStore.send(.decrementButtonTapped)
                        }
                        Button("Increment") {
                            viewStore.send(.incrementButtonTapped)
                        }
                    }
                    Section {
                        Button("Get Fact") {
                            viewStore.send(.getFactButtonTapped)
                        }
                        if let fact = viewStore.fact {
                            Text(fact)
                        }
                    }
                    Section {
                        if viewStore.isTimerOn {
                            Button("Stop") {
                                viewStore.send(.toggleButtonTimerTapped)
                            }
                        } else {
                            Button("Start") {
                                viewStore.send(.toggleButtonTimerTapped)
                            }
                        }
                    }
                }
            }
        )
    }
}

extension CounterAppView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.architecture], version: .iOS14)
    }

    private static let instance = CounterAppView(
        store: Store(
            initialState: CounterFeature.State(),
            reducer: {
                CounterFeature()
            }
        )
    )

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CounterAppView(
            store: Store(
                initialState: CounterFeature.State(),
                reducer: {
                    CounterFeature()
                    ._printChanges()
                }
            )
        )
    }
}
