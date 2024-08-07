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
        var isTimerRunning = false
    }

    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
        case factButtonTapped
        case factResponse(String)
        case toggleTimerButtonTapped
        case timerTick
    }

    enum CancelID { case timer }

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
            return .run { [count = state.count] send in
                let (data, _) = try await URLSession.shared
                    .data(from: URL(string: "http://numbersapi.com/\(count)")!)
                let fact = String(decoding: data, as: UTF8.self)
                await send(.factResponse(fact))
            }

        case let .factResponse(fact):
            state.fact = fact
            state.isLoading = false
            return .none

        case .timerTick:
            state.count += 1
            state.fact = nil
            return .none

        case .toggleTimerButtonTapped:
            state.isTimerRunning.toggle()
            if state.isTimerRunning {
                return .run { send in
                    while true {
                        try await Task.sleep(seconds: 1)
                        await send(.timerTick)
                    }
                }
                .cancellable(id: CancelID.timer)
            } else {
                return .cancel(id: CancelID.timer)
            }
        }
    }
}

extension Task where Success == Never, Failure == Never {
    static func sleep(seconds: Double) async throws {
        let duration = UInt64(seconds * 1_000_000_000)
        try await Task.sleep(nanoseconds: duration)
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
                    Button(
                        viewStore.isTimerRunning ? "Stop timer" : "Start timer"
                    ) {
                        viewStore.send(.toggleTimerButtonTapped)
                    }
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)

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
                        ScrollView {
                            Text(fact)
                                .font(.largeTitle)
                                .multilineTextAlignment(.center)
                                .padding()
                        }
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
