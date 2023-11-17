//
//  PressSubmitButtonView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 17.11.23.
//

import Foundation
import SwiftUI

struct PressSubmitButtonView: View {
    @ObservedObject private var buttonStateStore: PressButtonStateStore
    @State private var rotationAngle: Angle = .zero

    private let viewModel: PressButtonViewModel
    init(
        buttonStateStore: PressButtonStateStore,
        viewModel: PressButtonViewModel
    ) {
        self.buttonStateStore = buttonStateStore
        self.viewModel = viewModel
    }

    var body: some View {
        Button(
            action: {
                if buttonStateStore.value == .enable {
                    viewModel.onSubmitFeedback?()
                }
            }, label: {
                switch buttonStateStore.value {
                case .enable: enableButtonLabel
                case .disable: disableButtonLabel
                case .loading: submitButtonLoading.onAppear() { loadingIconAnimation() }
                }
            }
        )
    }

    private var disableButtonLabel: some View {
        Text(viewModel.submitButtonTitle)
            .font(Font(UIFont.systemFont(ofSize: 16, weight: .bold)))
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.black.opacity(0.26))
            .padding()
            .background(Color.black.opacity(0.12))
            .cornerRadius(8)
            .padding(.top, 16)
            .padding(.bottom, 8)
    }

    private var enableButtonLabel: some View {
        Text(viewModel.submitButtonTitle)
            .font(Font(UIFont.systemFont(ofSize: 16, weight: .bold)))
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding()
            .background(Color(red: 0.65, green: 0.05, blue: 1))
            .cornerRadius(8)
            .padding(.top, 16)
            .padding(.bottom, 8)
    }

    private var submitButtonLoading: some View {
        Image(viewModel.reloadingIconName)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .rotationEffect(rotationAngle)
    }

    private func loadingIconAnimation() {
        withAnimation(Animation.linear(duration: 2.0).repeatForever(autoreverses: false)) {
            rotationAngle = .degrees(360)
        }
    }
}
