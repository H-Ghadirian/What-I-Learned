//
//  MemoryLeakViewController.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 27.02.24.
//

import UIKit

class MyButton: UIButton {
    var handler: (() -> Void)?

    func setupButton() {
        print("Hamed setupButton")
        setTitleColor(.black, for: .normal)
        backgroundColor = .white
        layer.cornerRadius = 8.0
        setTitle("Press Me", for: .normal)
        frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    @objc func buttonPressed() {
        handler?()
    }
}

class MemoryLeakViewController: UIViewController {

    private var buyButton: MyButton = {
        let button = MyButton(type: .system)
        button.setupButton()
        return button
    }()

    func shouldShowPromotion(_ closure: () -> Void) -> Bool {
        print("shouldShowPromotion")
        return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(buyButton)

        buyButton.handler = { [weak self] in
            self?.showPromotionView()
        }
        if shouldShowPromotion({ print("happened") }) {
            print("again")
        }
    }

    private func showPromotionView() {
        print("printed!")
    }
}
