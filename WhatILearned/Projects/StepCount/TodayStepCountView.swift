//
//  TodayStepCountView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 12.12.23.
//

import Foundation
import SwiftUI

struct TodayStepCountView: View {
    @State var viewModel: HealthKitViewModel = HealthKitViewModel()
//    public init(viewModel: HealthKitViewModel) {
//        self._viewModel = .init(wrappedValue: viewModel)
//        print("WHamL init with viewModel")
//    }
//    init() {
//        print("WHamL init")
//    }
    var body: some View {
        VStack {
            if viewModel.isAuthorized {
                VStack {
                    Text("Today's Step Count")
                        .font(.title3)

                    Text("\(viewModel.userStepCount)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
            } else {
                VStack {
                    Text("Please Authorize Health!")
                        .font(.title3)

                    Button {
                        viewModel.healthRequest()
                        print(type(of: self.body))
                    } label: {
                        Text("Authorize HealthKit")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .frame(width: 320, height: 55)
                    .background(Color(.orange))
                    .cornerRadius(10)
                }
            }
        }
        .padding()
        .onAppear {
            viewModel.readStepsTakenToday()
        }
    }
}
/// swiftlint:disable force_cast
extension TodayStepCountView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.library], version: .iOS14)
    }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    static var instance = TodayStepCountView()

    var link: URL? {
        URL(string: "https://betterprogramming.pub/get-step-count-data-from-healthkit-b6d1a2818e73")
    }

}
// swiftlint:enable force_cast
struct TodayStepCountView_Previews: PreviewProvider {
    static var previews: some View {
        TodayStepCountView()
//            .environmentObject(HealthKitViewModel())
    }
}

// ModifiedContent<
//    ModifiedContent<
//        VStack<
//            _ConditionalContent<
//                VStack<
//                    TupleView<(Text, Text)>
//                >,
//                VStack<
//                    TupleView<
//                        (Text, 
//                         ModifiedContent<
//                             ModifiedContent<
//                                 ModifiedContent<
//                                         Button<Text>,
//                                         _FrameLayout
//                                 >,
//                                 _BackgroundModifier<Color>
//                             >,
//                            _ClipEffect<RoundedRectangle>
//                         >
//                        )
//                    >
//                >
//            >
//        >,
//        _PaddingLayout
//    >,
//    _AppearanceActionModifier
// >
