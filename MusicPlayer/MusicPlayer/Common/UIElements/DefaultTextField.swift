//
//  DefaultTextField.swift
//  MusicPlayer
//
//  Created by Артем Галай on 10.01.23.
//

import UIKit

private extension Appearance {
    var placeholderFont: UIFont { .systemFont(ofSize: 16) }
    var placeholderColor: UIColor { .gray }
    var textFieldColor: CGColor { UIColor.white.cgColor }

    var textPadding: UIEdgeInsets {
        .init(
            top: 0,
            left: 10,
            bottom: 0,
            right: 10
        )
    }
}

final class DefaultTextField: UITextField {

    private let appearance = Appearance()

    init(placeholder: String? = nil) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        configureTextField()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureTextField() {
        textAlignment = .left
        layer.backgroundColor = appearance.textFieldColor
        layer.cornerRadius = appearance.baseCornerRadius
        clearButtonMode = .whileEditing
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: appearance.placeholderColor]
        )
    }
}

extension DefaultTextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: appearance.textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: appearance.textPadding)
    }
}
