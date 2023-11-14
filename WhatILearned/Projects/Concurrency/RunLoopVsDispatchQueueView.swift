//
//  RunLoopVsDispatchQueueView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 14.11.23.
//

import Foundation
import SwiftUI

struct RunLoopVsDispatchQueueView: View {

    @ObservedObject var viewModel = RunLoopVsDispatchQueueViewModel()
    var body: some View {
        ScrollView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.medium)
                    .foregroundColor(.blue)
                Text("RunLoop default timer: \(viewModel.defaultTimer)")
                Text("RunLoop common timer: \(viewModel.commonTimer)")
            }
        }
    }
}

extension RunLoopVsDispatchQueueView: ProjectProtocol {
    var tags: ProjectTags {
        ProjectTags(
            tags: [.functionality],
            version: .iOS14
        )
    }

    var presentationMode: PresentationMode { .modal(isFullScreen: true) }

    static private let instance = RunLoopVsDispatchQueueView()
    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }
}

struct RunLoopVsDispatchQueueView_Previews: PreviewProvider {
    static var previews: some View {
        RunLoopVsDispatchQueueView()
    }
}
