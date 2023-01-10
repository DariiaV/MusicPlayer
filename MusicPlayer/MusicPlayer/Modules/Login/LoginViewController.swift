//
//  LoginViewController.swift
//  MusicPlayer
//
//  Created by Артем Галай on 10.01.23.
//

import UIKit

final class LoginViewController: UIViewController {

    private let customView = LoginView()

    override func loadView() {
        super.loadView()
        view = customView
    }

    private func tapToLogInButton() {
        customView.singInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
    }

    @objc private func logInButtonTapped() {
        
        
    }
}
