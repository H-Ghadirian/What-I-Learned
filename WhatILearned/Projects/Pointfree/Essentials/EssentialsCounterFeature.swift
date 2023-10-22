//
//  CounterFeature.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 22.10.23.
//

import ComposableArchitecture
import SwiftUI
import Foundation

struct EssentialsCounterFeature: Reducer {
    struct State {
        var count = 0
        var fact: String?
        var isLoading = false
    }

    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
        case factButtonTapped
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .decrementButtonTapped:
            state.count -= 1
            state.fact = nil
            return .none

        case .incrementButtonTapped:
            state.count += 1
            state.fact = nil
            return .none

        case .factButtonTapped:
            state.fact = nil
            state.isLoading = true
            return .none
        }
    }
}

extension EssentialsCounterFeature.State: Equatable { }

struct EssentialsCounterView: View {
    let store: StoreOf<EssentialsCounterFeature>

    var body: some View {
        WithViewStore(
            self.store,
            observe: { $0 },
            content: { viewStore in
                VStack {
                    Text("\(viewStore.count)")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                    HStack {
                        Button("-") {
                            viewStore.send(.decrementButtonTapped)
                        }
                        .font(.largeTitle)
                        .padding()
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)

                        Button("+") {
                            viewStore.send(.incrementButtonTapped)
                        }
                        .font(.largeTitle)
                        .padding()
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                    }
                    Button("Fact") {
                        viewStore.send(.factButtonTapped)
                    }
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)

                    if viewStore.isLoading {
                        ProgressView()
                    } else if let fact = viewStore.fact {
                        Text(fact)
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                }
            }
        )
    }
}

extension EssentialsCounterView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.architecture], version: .iOS14)
    }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    static let instance = EssentialsCounterView(
        store: Store(
            initialState: EssentialsCounterFeature.State()
        ) {
            EssentialsCounterFeature()
                ._printChanges()
        }
    )
}

struct EssentialsCounterPreview: PreviewProvider {
  static var previews: some View {
      EssentialsCounterView(
      store: Store(initialState: EssentialsCounterFeature.State()) {
          EssentialsCounterFeature()
      }
    )
  }
}
