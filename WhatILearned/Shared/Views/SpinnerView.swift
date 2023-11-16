//
//  SpinnerView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 16.11.23.
//

import SwiftUI
struct SpinnerView: View {
    @State private var degree: Double = 0.0
    @State private var spinnerLength: CGFloat = 0.6

    var body: some View {
        Circle()
            .trim(from: 0.0, to: spinnerLength)
            .stroke(
                LinearGradient(
                    colors: [.red, .blue],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round)
            )
            .frame(width: 60, height: 60)
            .rotationEffect(Angle(degrees: degree))
            .onAppear {
                animateRotation()
            }
    }
    private func animateRotation() {
        withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
            degree += 360
        }
    }
}
