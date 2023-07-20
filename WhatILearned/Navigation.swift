//
//  Coordinator.swift
//  WhatILearned
//
//  Created by Paul, Arup, HSE DE on 20.07.23.
//

import Foundation
import SwiftUI


public protocol CoordinatorProtocol: ObservableObject {
    associatedtype Path: Hashable & Identifiable
    var activePath: Path.ID? { get set }
    var activeSheetPath: Path? { get set }
    var allPaths: [Path] { get }
    func view(for state: Path) -> AnyView
    func start()
}

public struct NavigatorView<C: CoordinatorProtocol, Content: View>: View {
    
    @ObservedObject private var coordinator: C
    private let contentBuilder: () -> Content
    public init(_ cord: C, @ViewBuilder content: @escaping () -> Content) {
        self.coordinator = cord
        contentBuilder = content
    }

    public var body: some View {
        NavigationView {
            ZStack {
                contentBuilder()
                    .coordinatorView(coordinator: coordinator)
            }
        }
    }
}

struct CoordinatorModifier<T: CoordinatorProtocol>: ViewModifier {
    @ObservedObject var coordinator: T

    func body(content: Content) -> some View {
        ZStack {
            content
            VStack{
                ForEach(coordinator.allPaths, id: \.id) { data in
                    withAnimation {
                        NavigationLink("", tag: data.id, selection: $coordinator.activePath) {
                            AnyView(coordinator.view(for: data))
                        }
                    }
                }
            }
            .offset(x: 100)
            .sheet(item: $coordinator.activeSheetPath) { id in
                if let sheet = coordinator.activeSheetPath {
                    AnyView(coordinator.view(for: sheet))
                }
            }
        }
    }
}

extension View {
    func coordinatorView<T: CoordinatorProtocol>(coordinator: T) -> some View {
        return self.modifier(CoordinatorModifier(coordinator: coordinator))
    }
}
