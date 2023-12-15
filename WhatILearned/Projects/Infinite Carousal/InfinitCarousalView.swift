//
//  InfinitCarousalView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 15.12.23.
//

import Foundation
import SwiftUI

@available(iOS 15.0, *)
struct InfinitCarousalView: View {

    @GestureState private var dragState = DragState.inactive
    @State var carousalLocation = 0

    var itemHeight: CGFloat
    var views: [AnyView]

    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<views.count) { page in
                    VStack {
                        Spacer()

                        self.views[page]
                            .frame(width: 300, height: getHeight(page))
                            .animation(.interpolatingSpring(stiffness: 300, damping: 30, initialVelocity: 10))
                            .background(.white)
                            .cornerRadius(15)
                            .opacity(getOpacity(page))
                            .offset(x: getOffset(page))
                            .animation(.interpolatingSpring(stiffness: 300, damping: 30, initialVelocity: 10))

                        Spacer()
                    }
                }
            }
            .gesture(
                DragGesture()
                    .updating($dragState) { drag, state, _ in
                        state = .dragging(translation: drag.translation)
                    }
                    .onEnded(onDragEnded)
            )

        }
    }

    private func onDragEnded(drag: DragGesture.Value) {
        let dragThreshold: CGFloat = 200
        if drag.predictedEndTranslation.width > dragThreshold ||
            drag.translation.width > dragThreshold {
            carousalLocation -= 1
        } else if (drag.predictedEndTranslation.width) < (-1 * dragThreshold) ||
                    (drag.translation.width) < (-1 * dragThreshold) {
            carousalLocation += 1
        }
    }

    var relativeLoc: Int {
        ((views.count * 10000) + carousalLocation) % views.count
    }

    func getOffset(_ index: Int) -> CGFloat {
        if index == relativeLoc {
            return dragState.translation.width
        } else if index == relativeLoc + 1 ||
                    relativeLoc == views.count - 1 && index == 0 {
            return dragState.translation.width + (300 + 20)
        } else if index == relativeLoc - 1 ||
                    relativeLoc == 0 && index == views.count - 1 {
            return dragState.translation.width - (300 + 20)
        } else if index == relativeLoc + 2 ||
                    (relativeLoc == views.count - 1 && index == 1) ||
                    (relativeLoc == views.count - 2 && index == 0) {
            return dragState.translation.width + (2*(300 + 20))
        } else if index == relativeLoc - 2 ||
                    (relativeLoc == 1 && index == views.count - 1) ||
                    (relativeLoc == 0 && index == views.count - 2) {
            return dragState.translation.width - (2*(300 + 20))
        } else if index == relativeLoc + 3 ||
                    (relativeLoc == views.count - 1 && index == 2) ||
                    (relativeLoc == views.count - 2 && index == 1) ||
                    (relativeLoc == views.count - 3 && index == 0) {
            return dragState.translation.width + (3*(300 + 20))
        } else if index == relativeLoc - 3 ||
                    (relativeLoc == 2 && index == views.count - 1) ||
                    (relativeLoc == 1 && index == views.count - 2) ||
                    (relativeLoc == 0 && index == views.count - 3) {
            return dragState.translation.width - (3*(300 + 20))
        } else {
            return 10000
        }
    }

    func getHeight(_ index: Int) -> CGFloat {
        if index == relativeLoc {
            return itemHeight
        }
        return itemHeight - 100
    }

    func getOpacity(_ index: Int) -> Double {
        if index == relativeLoc
            || index + 1 == relativeLoc
            || index - 1 == relativeLoc
            || index + 2 == relativeLoc
            || index - 2 == relativeLoc
            || (index + 1) - views.count == relativeLoc
            || (index - 1) - views.count == relativeLoc
            || (index + 2) - views.count == relativeLoc
            || (index - 2) - views.count == relativeLoc {
            return 1
        }
        return 0
    }
}
