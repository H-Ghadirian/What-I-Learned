import ComposableArchitecture
import SwiftUI

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
                // TODO: perform network request
                break
            case .toggleButtonTimerTapped:
                state.isTimerOn.toggle()
                // start timer
            }
            return .none
        }
    }
}

struct SwiftUIView: View {
//    let store: Store<CounterFeature.State, CounterFeature.Action>
    let store: StoreOf<CounterFeature>

    var body: some View {
        WithViewStore(
            self.store,
            observe: { $0 }
        ) { viewStore in
            Form {
                Section {
                    Button("T") {
                        print("Hello")
                    }
                    VStack {
                        Text("Hello, World!")
                    }
                }
                Section {
                    VStack {
                        Text("Hello, World!")
                    }
                    Button("T") {
                        print("Hello")
                    }
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
//        SwiftUIView(store: <#StoreOf<CounterFeature>#>)
    }
}
