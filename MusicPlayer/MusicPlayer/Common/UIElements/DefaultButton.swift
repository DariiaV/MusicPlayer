//
//  DefaultButton.swift
//  MusicPlayer
//
//  Created by Артем Галай on 10.01.23.
//

import UIKit

private extension Appearance {
    var buttonColor: UIColor { .systemMint }
    var buttonFont: UIFont { .systemFont(ofSize: 14) }
}

final class DefaultButton: UIButton {

    private let appearance = Appearance()

    init(titleText: String) {
        super.init(frame: .zero)
        setTitle(titleText, for: .normal)
        titleLabel?.font = appearance.buttonFont
        layer.cornerRadius = appearance.baseCornerRadius
        backgroundColor = .systemMint
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
