//
//  LoginViewController.swift
//  MusicPlayer
//
//  Created by Артем Галай on 10.01.23.
//

import UIKit
import FirebaseAuth
import Firebase

final class LoginViewController: UIViewController {

    private let customView = LoginView()

    override func loadView() {
        super.loadView()
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tapToSingInButton()
    }

    private func tapToSingInButton() {
        customView.singInButton.addTarget(self, action: #selector(singInButtonTapped), for: .touchUpInside)
    }

    @objc private func singInButtonTapped() {
        Auth.auth().signIn(withEmail: customView.emailTextField.text!,
                           password: customView.passwordTextField.text!) { auth, error in
            if error != nil {
                self.customView.emailTextField.text! = "\(String(describing: error?.localizedDescription))"
            } else {
                print("Success")
            }
        }
        ///Переход на главный экран
    }
}
