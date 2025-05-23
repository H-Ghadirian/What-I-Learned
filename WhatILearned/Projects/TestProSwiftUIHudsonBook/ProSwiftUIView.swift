//
//  ProSwiftUIView.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 17.07.24.
//
import MessageUI
import SwiftUI

/// It is from Hudson pro swiftui book!
struct ProSwiftUIView: View {
    @State var canSendEmail: Bool = false
    var body: some View {
        VStack(spacing: 16) {
            Button("Can send e-mail?") {
//                let mail = MFMailComposeViewController()
//                        mail.mailComposeDelegate = self
//                        mail.setToRecipients(["you@yoursite.com"])
//                        mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)

//                present(mail, animated: true)
                canSendEmail = MFMailComposeViewController.canSendMail()
            }
            Text(canSendEmail ? "Yes" : "No")
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(idealWidth: 300, idealHeight: 300)
                .border(Color.blue)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .border(Color.yellow)
                .frame(minWidth: 350, minHeight: 400)
                .border(Color.red)
                .frame(width: 300, height: 300)
                .border(Color.black)
                .onTapGesture {
                    print(type(of: self.body))
                }
            Text("Another one")
                .frame(width: 100)
                .background(Color.red)
                .frame(minWidth: 150)
                .background(Color.yellow)
                .frame(maxWidth: 250)
                .background(Color.blue)
        }
    }
}

#Preview {
    ProSwiftUIView()
}

extension ProSwiftUIView: ProjectProtocol {
    var tags: ProjectTags {
        .init(tags: [.swiftui], version: .iOS14)
    }

    static func project() -> any ProjectProtocol {
        instance
    }

    static func run() -> AnyView {
        AnyView(instance)
    }

    static var instance = ProSwiftUIView()

}
