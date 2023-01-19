//
//  TitleLabel.swift
//  MusicPlayer
//
//  Created by Артем Галай on 10.01.23.
//

import UIKit

private extension CGFloat {
    static let titleLabelFont: CGFloat = 30
}

final class TitleLabel: UILabel {

    init(title: String) {
        super.init(frame: .zero)
        text = title
        configureTitleLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureTitleLabel() {
        font = UIFont.systemFont(ofSize: CGFloat.titleLabelFont)
        textAlignment = .center
        textColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
}
