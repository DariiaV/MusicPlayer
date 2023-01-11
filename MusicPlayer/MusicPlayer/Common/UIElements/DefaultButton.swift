//
//  DefaultButton.swift
//  MusicPlayer
//
//  Created by Артем Галай on 10.01.23.
//

import UIKit

private extension CGFloat {
    static let buttonFont: CGFloat = 14
}

final class DefaultButton: UIButton {

    init(titleText: String) {
        super.init(frame: .zero)
        setTitle(titleText, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: CGFloat.buttonFont)
        layer.cornerRadius = CGFloat.baseCornerRadius
        backgroundColor = .systemMint
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
