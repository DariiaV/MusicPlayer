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

    private func tapToSingInButton() {
        customView.singInButton.addTarget(self, action: #selector(singInButtonTapped), for: .touchUpInside)
    }

    @objc private func singInButtonTapped() {
        ///Переход на главный экран
    }
}
