//
//  RegistrationViewController.swift
//  MusicPlayer
//
//  Created by Артем Галай on 12.01.23.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    private let customView = RegistrationView()
    
    override func loadView() {
        super.loadView()
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
    }

    private func addTarget() {
        customView.singInButton.addTarget(self, action: #selector(singInButtonTapped), for: .touchUpInside)
        customView.signInLabel.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel)))
    }

    @objc private func singInButtonTapped() {
        #warning("Переход на главный экран или на экран Login?")
    }
    
    @objc private func tapLabel(gesture: UITapGestureRecognizer) {
        let range = (customView.signInLabel.text as? NSString ?? "").range(of: "Sign in")
        
        if gesture.didTapAttributedTextInLabel(label: customView.signInLabel, inRange: range) {
            let viewController = LoginViewController()
            navigationController?.present(viewController, animated: true)
        }
    }
}
