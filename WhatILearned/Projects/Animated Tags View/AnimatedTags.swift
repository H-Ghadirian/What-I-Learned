////
////  AnimatedTags.swift
////  WhatILearned
////
////  Created by Ghadirian, Hamed, HSE DE on 15.07.24.
////
//
//import Foundation
//import SwiftUI
//
//@available(iOS 16.0, *)
//struct AnimatedTagsView: View {
//    @State var notSelectedtags: [String] = Tag.allCases.map { $0.rawValue }
//    @State var selectedTags: [String] = Tag.allCases.map { $0.rawValue }
//
//    var body: some View {
//        VStack(spacing: 0) {
//            ScrollView(.horizontal) {
//                HStack {
//                    ForEach(selectedTags, id: \.self) { selectedTag in
//                        tagView(selectedTag, .pink, icon: "checkmark")
//                    }
//                }
//                .padding(.vertical, 15)
//            }
//            .overlay {
//                if selectedTags.isEmpty {
//                    Text("Select more than 3!")
//                }
//            }
//
//            ScrollView(.vertical) {
//            }
//            .background(.black.opacity(0.05))
//
//            ZStack(
//                content: {
//                    Button(
//                        action: {},
//                        label: {
//                            Text("Done")
//                                .padding(.vertical, 15)
//                                .frame(maxWidth: .infinity)
//                                .foregroundColor(.white)
//                                .background {
//                                    RoundedRectangle(
//                                        cornerRadius: 12
//                                    ).fill(.pink.gradient)
//                                }
//                        }
//                    )
//                    .disabled(selectedTags.count < 3)
//
//                }
//            )
//            .padding()
//        }
//    }
//
//    @ViewBuilder
//    func tagView(_ tag: String, _ color: Color, icon: String) -> some View {
//        HStack {
//            Text(tag)
//                .font(.callout)
//                .fontWeight(.semibold)
//            Image(systemName: icon)
//        }
//        .frame(height: 40)
//        .foregroundStyle(.white)
//        .padding(.horizontal, 15)
//        .background {
//            Capsule().fill(color.gradient)
//        }
//    }
//}
//
//@available(iOS 16.0, *)
//extension AnimatedTagsView: ProjectProtocol {
//    var tags: ProjectTags {
//        .init(tags: [.library], version: .iOS14)
//    }
//
//    static func project() -> any ProjectProtocol {
//        instance
//    }
//
//    static func run() -> AnyView {
//        AnyView(instance)
//    }
//
//    static var instance = TodayStepCountView()
//
//    var link: URL? {
//        URL(string: "https://betterprogramming.pub/get-step-count-data-from-healthkit-b6d1a2818e73")
//    }
//
//}
//
//@available(iOS 16.0, *)
//#Preview {
//    AnimatedTagsView()
//}
