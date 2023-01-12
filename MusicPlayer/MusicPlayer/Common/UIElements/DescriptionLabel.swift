//
//  DescriptionLabel.swift
//  MusicPlayer
//
//  Created by Артем Галай on 10.01.23.
//

import UIKit

private extension CGFloat {
    static let titleFont: CGFloat = 14
}

final class DescriptionLabel: UILabel {

    init(title: String) {
        super.init(frame: .zero)
        text = title
        configureTitleLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureTitleLabel() {
        font = UIFont.systemFont(ofSize: CGFloat.titleFont)
        textAlignment = .left
        textColor = .white
    }
}
