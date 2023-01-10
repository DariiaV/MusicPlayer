//
//  DescriptionLabel.swift
//  MusicPlayer
//
//  Created by Артем Галай on 10.01.23.
//

import UIKit

private extension Appearance {
    var titleFont: UIFont { .systemFont(ofSize: 14) }
}

final class DescriptionLabel: UILabel {

    private let appearance = Appearance()

    init(title: String) {
        super.init(frame: .zero)
        text = title
        configureTitleLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureTitleLabel() {
        font = appearance.titleFont
        textAlignment = .left
        textColor = .white
    }
}
