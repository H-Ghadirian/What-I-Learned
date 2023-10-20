//
//  RatingView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 20.10.23.
//

import Foundation
import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    private let startEmpty = Image(systemName: "star")
    private let starFill = Image(systemName: "star.fill")

    private let onColor = Color.gray
    private let offColor = Color.yellow

    var body: some View {
        HStack {
            ForEach(1..<6) { number in
                if number > rating {
                    startEmpty
                        .resizable()
                        .onTapGesture {
                            rating = number
                        }
                } else {
                    starFill
                        .resizable()
                        .onTapGesture {
                            rating = number
                        }
                }
            }
            .frame(width: 30, height: 30)
            .padding()
            .border(Color.black)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .accentColor(Color.black)
        .background(Color.pink)
    }
}

struct RatingScreenView: View {
    @State private var rate = 2
    var body: some View {
        RatingView(rating: $rate)
    }
}

extension RatingScreenView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS14)
    }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    private static let instance = RatingScreenView()
}

#Preview {
    RatingView(rating: .constant(2))
}
