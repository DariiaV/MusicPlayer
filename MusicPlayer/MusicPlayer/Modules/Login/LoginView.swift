//
//  LoginView.swift
//  MusicPlayer
//
//  Created by Артем Галай on 10.01.23.
//

import UIKit
import SnapKit

private extension Appearance {
    var height: CGFloat { 50 }
}

final class LoginView: BaseView {

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = appearance.baseMediumSpacing
        return stackView
    }()

    let singInButton = DefaultButton(titleText: "Sing in")

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
        contentStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(appearance.baseLargeSpacing)
            make.leading.trailing.equalToSuperview().inset(appearance.baseMediumSpacing)
            make.bottom.lessThanOrEqualToSuperview()
        }

        [logoImage, name, title, emailTextField, passwordTextField, singInButton].forEach {
            $0.snp.makeConstraints { make in
                make.height.equalTo(appearance.height)
            }
        }

        contentStackView.setCustomSpacing(appearance.baseSpacing, after: logoImage)
        contentStackView.setCustomSpacing(appearance.baseSpacing, after: emailLabel)
        contentStackView.setCustomSpacing(appearance.baseSpacing, after: passwordLabel)
        contentStackView.setCustomSpacing(appearance.baseSpacing, after: passwordTextField)
    }
}
