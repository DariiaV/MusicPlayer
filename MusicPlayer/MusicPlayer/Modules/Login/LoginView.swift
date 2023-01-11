//
//  LoginView.swift
//  MusicPlayer
//
//  Created by Артем Галай on 10.01.23.
//

import UIKit

private extension CGFloat {
    static let height: CGFloat = 50
    static let contentStackViewTopAnchor: CGFloat = 20
    static let contentStackViewBottomAnchor: CGFloat = -180
}

final class LoginView: BaseView {

    let singInButton = DefaultButton(titleText: "Sing in")

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = CGFloat.baseMediumSpacing
        return stackView
    }()

    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let name: UILabel = {
        let label = UILabel()
        label.text = "Music Player"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .systemBlue
        return label
    }()

    private let title = TitleLabel(title: "Sign in to your account")

    private let emailLabel = DescriptionLabel(title: "Email address")

    private let emailTextField = DefaultTextField(placeholder: "Email")

    private let passwordLabel = DescriptionLabel(title: "Password")

    private let passwordTextField = DefaultTextField(placeholder: "Password")

    private let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot your password?", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.setTitleColor(.systemPink, for: .normal)
        return button
    }()

    override func addSubviews() {
        super.addSubviews()
        addSubview(contentStackView)

        contentStackView.addArrangedSubviews([
            logoImage,
            name,
            title,
            emailLabel,
            emailTextField,
            passwordLabel,
            passwordTextField,
            forgotPasswordButton,
            singInButton
        ])
    }

    override func makeConstraints() {
        super.makeConstraints()
        NSLayoutConstraint.activate([

            contentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: CGFloat.contentStackViewTopAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.baseLightSpacing),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat.baseLightSpacing),
            contentStackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),

            logoImage.heightAnchor.constraint(equalToConstant: CGFloat.height),
            title.heightAnchor.constraint(equalToConstant: CGFloat.height),
            name.heightAnchor.constraint(equalToConstant: CGFloat.height),
            emailLabel.heightAnchor.constraint(equalToConstant: CGFloat.baseSpacing),
            emailTextField.heightAnchor.constraint(equalToConstant: CGFloat.height),
            passwordLabel.heightAnchor.constraint(equalToConstant: CGFloat.baseSpacing),
            passwordTextField.heightAnchor.constraint(equalToConstant: CGFloat.height),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: CGFloat.baseSpacing),
            singInButton.heightAnchor.constraint(equalToConstant: CGFloat.height)
        ])

        contentStackView.setCustomSpacing(CGFloat.baseSpacing, after: emailLabel)
        contentStackView.setCustomSpacing(CGFloat.baseSpacing, after: name)
        contentStackView.setCustomSpacing(CGFloat.baseSpacing, after: passwordLabel)
        contentStackView.setCustomSpacing(CGFloat.baseSpacing, after: passwordTextField)
    }
}
