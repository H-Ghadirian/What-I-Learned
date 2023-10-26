//
//  OnTapGestureLocation.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 26.10.23.
//

import SwiftUI

@available(iOS 16.0, *)
struct OnTapGestureLocation: View {
    @State private var location = ""

    var body: some View {
        VStack(spacing: 16) {
            Text(location)
            HStack(spacing: 16) {
                Circle()
                    .fill(.gray)
                    .frame(width: 100, height: 100)
                    .onTapGesture(coordinateSpace: .global) { location in
                        self.location = "\(location))"
                    }
                Circle()
                    .fill(.red)
                    .frame(width: 100, height: 100)
                    .onTapGesture(coordinateSpace: .global) { location in
                        self.location = "\(location))"
                    }
            }
            HStack(spacing: 16) {
                Circle()
                    .fill(.yellow)
                    .frame(width: 100, height: 100)
                    .onTapGesture(coordinateSpace: .global) { location in
                        self.location = "\(location))"
                    }
                Circle()
                    .fill(.blue)
                    .frame(width: 100, height: 100)
                    .onTapGesture(coordinateSpace: .global) { location in
                        self.location = "\(location))"
                    }
            }
        }
    }
}

@available(iOS 16.0, *)
extension OnTapGestureLocation: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS16)
    }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    static let instance = OnTapGestureLocation()
}
