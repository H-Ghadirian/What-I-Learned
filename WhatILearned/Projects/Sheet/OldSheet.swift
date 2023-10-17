//
//  OldSheet.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 16.10.23.
//

import Foundation
import SwiftUI

private enum Constants {
    static let radius: CGFloat = 16
    static let indicatorHeight: CGFloat = 4
    static let indicatorWidth: CGFloat = 40
    static let snapRatio: CGFloat = 0.25
    static let minHeightRatio: CGFloat = 0.5
}

struct BottomSheetView<Content: View>: View {
    @Binding var isOpen: Bool

    let maxHeight: CGFloat
    let minHeight: CGFloat
    let content: Content

    @GestureState private var translation: CGFloat = 0

    private var offset: CGFloat {
        isOpen ? 0 : maxHeight - minHeight
    }

    private var indicator: some View {
        RoundedRectangle(cornerRadius: Constants.radius)
            .fill(Color.secondary)
            .frame(
                width: Constants.indicatorWidth,
                height: Constants.indicatorHeight
        ).onTapGesture {
            self.isOpen.toggle()
        }
    }

    init(
        isOpen: Binding<Bool>,
        maxHeight: CGFloat,
        @ViewBuilder content: () -> Content
    ) {
        self.minHeight = maxHeight * Constants.minHeightRatio
        self.maxHeight = maxHeight
        self.content = content()
        self._isOpen = isOpen
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                self.indicator.padding()
                self.content
            }
            .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(Constants.radius)
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: max(self.offset + self.translation, 0))
            .animation(.interactiveSpring())
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.height
                }.onEnded { value in
                    let snapDistance = self.maxHeight * Constants.snapRatio
                    guard abs(value.translation.height) > snapDistance else {
                        return
                    }
                    self.isOpen = value.translation.height < 0
                }
            )
        }
    }
}

struct OldSheetView: View {
    @State private var bottomSheetShown = false

    var body: some View {
        GeometryReader { geometry in
            Color.green
            BottomSheetView(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 0.6
            ) {
                Button {
                    bottomSheetShown.toggle()
                } label: {
                    Text(bottomSheetShown ? "Colapse me!": "Expand me!")
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

extension OldSheetView: ProjectProtocol {
    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    static var instance: OldSheetView {
        OldSheetView()
    }
}

struct TestView: View {
    var body: some View {
        Rectangle().fill(Color.red)
    }
}

struct OldSheetView_Previews: PreviewProvider {
    static var previews: some View {
        OldSheetView().edgesIgnoringSafeArea(.all)
    }
}
