//
//  RegistrationViewController.swift
//  MusicPlayer
//
//  Created by Артем Галай on 12.01.23.
//

import UIKit
import FirebaseAuth
import Firebase

final class RegistrationViewController: UIViewController {
    
    private let customView = RegistrationView()
    
    override func loadView() {
        super.loadView()
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
        checkValid()
    }

    private func addTarget() {
        customView.singInButton.addTarget(self, action: #selector(singInButtonTapped), for: .touchUpInside)
        customView.signInLabel.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel)))
    }

    @objc private func singInButtonTapped() {
        Auth.auth().createUser(withEmail: customView.emailTextField.text!,
                               password: customView.passwordTextField.text!) { auth, error  in
            if error != nil {
                self.customView.emailTextField.text! = "\(String(describing: error?.localizedDescription))"
            } else {
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: [
                    "name": self.customView.nameTextField.text ?? "",
                    "uid": auth?.user.uid ?? ""
                ]) { error in
                    if error != nil {
                        fatalError("Error saving user in database")
                    }
                }
                self.customView.signInLabel.text = "Поздравляем вы зарегистрировались!"
                self.customView.signInLabel.textColor = .systemGreen
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let viewController = LoginViewController()
            self.navigationController?.present(viewController, animated: true)
        }
#warning("Переход на главный экран или на экран Login?")
}

@objc private func tapLabel(gesture: UITapGestureRecognizer) {
    let range = (customView.signInLabel.text as? NSString ?? "").range(of: "Sign in")

    if gesture.didTapAttributedTextInLabel(label: customView.signInLabel, inRange: range) {
        let viewController = LoginViewController()
        navigationController?.present(viewController, animated: true)
    }
}

private func checkValid() {
    if customView.nameTextField.text!.isEmpty && customView.emailTextField.text!.isEmpty && customView.passwordTextField.text!.isEmpty {


    } else {



    }

}
}
