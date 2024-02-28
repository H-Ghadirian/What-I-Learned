//
//  PresentSwiftUIViewController.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 12.10.23.
//

import UIKit
import SwiftUI

class PresentSwiftUIViewController: UIViewController {

    @IBAction func onButtonTapped(_ sender: Any) {
        let swiftUIView = TheUIViewControllerRepresentable()
        let hostingController = UIHostingController(rootView: swiftUIView)
        present(hostingController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
