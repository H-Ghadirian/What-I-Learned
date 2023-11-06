//
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 05.11.23.
//

import Foundation
import SwiftUI

public struct AdjustableSheetView<Content: View>: View {
    private var stops: [CGFloat]
    private let content: Content
    private let screenHeight: CGFloat = UIScreen.main.bounds.height

    private let viewModel: AdjustableSheetViewModel
    @ObservedObject private var store: AdjustableSheetStore

    init(
        initialHeight: CGFloat,
        content: Content,
        viewModel: AdjustableSheetViewModel,
        store: AdjustableSheetStore,
        stops: [CGFloat] = []
    ) {
        store.offset = screenHeight
        store.lastOffset = screenHeight - initialHeight
        self.store = store
        self.content = content
        self.stops = [80.0, initialHeight] + stops
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack {
            ZStack(alignment: .top) {
                Color(AdjustableSheetColor.background)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                VStack(spacing: 0) {
                    ZStack(alignment: .top) {
                        title
                        drawerIndicator
                    }
                    .background(Color(AdjustableSheetColor.background).padding([.leading, .trailing], 16))
                    .gesture(
                        DragGesture()
                            .onChanged(self.onChange(of:))
                            .onEnded(self.onDragEnd(with:))
                    )
                    content
                }
            }
            .frame(height: screenHeight)
            .ignoresSafeArea(edges: [.bottom])
            .offset(y: store.offset)
        }
        .background(overlay)
        .navigationBarHidden(true)
        .onAppear {
            withAnimation {
                store.offset = store.lastOffset
                store.globalOpacity = 1
            }
        }
    }

    var title: some View {
        HStack {
            Text(viewModel.title)
                .font(Font(AdjustableSheetFont.headline))
                .foregroundColor(Color(AdjustableSheetColor.primaryText))
            Spacer()
            Image(systemName: "xmark")
                .padding(4)
                .onTapGesture(perform: dismiss)
        }
        .padding([.leading, .trailing], 15)
        .padding([.top], 20)
        .padding([.bottom], 16)
    }

    var drawerIndicator: some View {
        Color(AdjustableSheetColor.separator)
            .frame(width: 40, height: 4)
            .clipShape(RoundedRectangle(cornerRadius: 2))
            .padding([.top], 8)
    }

    var overlay: some View {
        Color(AdjustableSheetColor.secondaryBackground)
            .ignoresSafeArea(edges: .all)
            .onTapGesture(perform: dismiss)
            .opacity(store.globalOpacity)
    }

    private func dismiss() {
        withAnimation(.easeInOut(duration: 0.25)) { store.offset = screenHeight; store.globalOpacity = 0 }
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: false) { [weak viewModel] _ in viewModel?.dismiss?() }
    }

    private func onChange(of dragValue: DragGesture.Value) {
        let startingPoint = store.lastOffset
        withAnimation(.spring(duration: 0.25)) { store.offset = max(dragValue.translation.height + startingPoint, 0) }
    }

    private func onDragEnd(with dragValue: DragGesture.Value) {
        var currentOffsetStop = screenHeight - stops[0]
        stops.forEach { stop in
            let stopOffset = screenHeight - stop
            if abs(currentOffsetStop - store.offset) > abs(stopOffset - store.offset) { currentOffsetStop = stopOffset }
        }
        store.lastOffset = currentOffsetStop
        withAnimation(.easeInOut(duration: 0.25)) { store.offset = currentOffsetStop }
        if currentOffsetStop == screenHeight - stops[0] { withAnimation { dismiss() } }
    }
}
