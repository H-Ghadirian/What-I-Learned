//
//  DropDownPickerState.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 02.12.23.
//

import Foundation
import SwiftUI

enum DropDownPickerState {
    case top
    case bottom
}

@available(iOS 15.0, *)
struct DropDownPickerExampleView: View {

    @State var selection1: String?

    var body: some View {
        VStack {

            Link(
                "Medium tutorial",
                destination: link!
            )

            DropDownPicker(
                selection: $selection1,
                options: [
                    "Apple",
                    "Google",
                    "Amazon",
                    "Facebook",
                    "Instagram"
                ]
            )

        }
    }
}

@available(iOS 15.0, *)
extension DropDownPickerExampleView: ProjectProtocol {
    var link: URL? {
        URL(string: "https://abbasgujjar2525.medium.com/custom-dropdown-in-swiftui-1e58b5237e6e")
    }

    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS15)
    }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    static let instance = DropDownPickerExampleView()
}

@available(iOS 15.0, *)
struct DropDownPicker: View {

    @Binding var selection: String?
    var state: DropDownPickerState = .top
    var options: [String]
    var maxWidth: CGFloat = 180

    @State var showDropdown = false

    @SceneStorage("drop_down_zindex") private var index = 1000.0
    @State var zindex = 1000.0

    var body: some View {
        GeometryReader {
            let size = $0.size

            VStack(spacing: 0) {

                if state == .top && showDropdown {
                    optionsView()
                }

                HStack {
                    Text(selection == nil ? "Select" : selection!)
                        .foregroundColor(selection != nil ? .black : .gray)

                    Spacer(minLength: 0)

                    Image(systemName: state == .top ? "chevron.up" : "chevron.down")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .rotationEffect(.degrees((showDropdown ? -180 : 0)))
                }
                .padding(.horizontal, 15)
                .frame(width: 180, height: 50)
                .background(.white)
                .contentShape(.rect)
                .onTapGesture {
                    index += 1
                    zindex = index
                    withAnimation(.snappy) {
                        showDropdown.toggle()
                    }
                }
                .zIndex(10)

                if state == .bottom && showDropdown {
                    optionsView()
                }
            }
            .clipped()
            .background(.white)
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray)
            }
            .frame(height: size.height, alignment: state == .top ? .bottom : .top)

        }
        .frame(width: maxWidth, height: 50)
        .zIndex(zindex)
    }

    func optionsView() -> some View {
        VStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                HStack {
                    Text(option)
                    Spacer()
                    Image(systemName: "checkmark")
                        .opacity(selection == option ? 1 : 0)
                }
                .foregroundStyle(selection == option ? Color.primary : Color.gray)
                .animation(.none, value: selection)
                .frame(height: 40)
                .contentShape(.rect)
                .padding(.horizontal, 15)
                .onTapGesture {
                    withAnimation(.snappy) {
                        selection = option
                        showDropdown.toggle()
                    }
                }
            }
        }
        .transition(.move(edge: state == .top ? .bottom : .top))
        .zIndex(1)
    }
}
