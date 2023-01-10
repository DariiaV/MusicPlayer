//
//  BaseView.swift
//  MusicPlayer
//
//  Created by Артем Галай on 10.01.23.
//

import UIKit

struct Appearance {
    var baseSpacing: CGFloat { 8 }
    var baseLightSpacing: CGFloat { 18 }
    var baseMediumSpacing: CGFloat { 42 }
    var baseLargeSpacing: CGFloat { 54 }
    var baseCornerRadius: CGFloat { 10 }
}

class BaseView: UIView {

    let appearance = Appearance()

    init() {
        super.init(frame: .zero)
        addSubviews()
        makeConstraints()
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews() {}

    func makeConstraints() {}

    func configureView() {
        backgroundColor = UIColor(patternImage: UIImage(named: "backgroundLogIn") ?? UIImage())
    }
}
