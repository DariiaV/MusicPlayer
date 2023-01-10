//
//  SoundLayerView.swift
//  MusicPlayer
//
//  Created by Александр Косяков on 08.01.2023.
//

import UIKit

class SoundLayerView: UIView  {
    
    // MARK: - UI Elements
    
    lazy var imageViewMain: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "nirvana")
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var authorLabel : UILabel = {
        
        let label = UILabel()
        label.text = "Nirvana"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    lazy var nameMusicLabel : UILabel = {
        
        let label = UILabel()
        label.text = "Where did you sleep last night?"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    lazy var favouritesButton : UIButton = {
        
        let button = UIButton ()
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setImage(UIImage(named: "heart 1"), for: .normal)
        return button
    }()
    
    lazy var musicSlider : UISlider = {
        
        let slider = UISlider ()
        slider.minimumTrackTintColor = .systemMint
        slider.maximumTrackTintColor = .gray
        slider.thumbTintColor = .systemMint
        return slider
    }()
    
    lazy var minuteStartLabel : UILabel = {
        
        let label = UILabel()
        label.text = "0:00"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    lazy var minuteFinishLabel : UILabel = {
        
        let label = UILabel()
        label.text = "0:00"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()
    
    lazy var playButton : UIButton = {
        
        let button = UIButton ()
        button.setImage(UIImage(named: "play"), for: .normal)
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var leftButton : UIButton = {
        
        let button = UIButton ()
        button.setImage(UIImage(named: "left 1"), for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var rightButton : UIButton = {
        
        let button = UIButton ()
        button.setImage(UIImage(named: "right 1"), for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var buttonStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 38
        return stack
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        addSybView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Setup Constrains

extension SoundLayerView {
    
    func addSybView() {
        addSubviews([
            imageViewMain,
            authorLabel,
            nameMusicLabel,
            favouritesButton,
            musicSlider,
            minuteStartLabel,
            minuteFinishLabel,
            buttonStack
        ])
        
        [leftButton, playButton, rightButton].forEach { buttonStack.addArrangedSubview($0) }
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageViewMain.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageViewMain.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            imageViewMain.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            imageViewMain.heightAnchor.constraint(equalToConstant:  1.halfScreen),
            
            authorLabel.topAnchor.constraint(equalTo: imageViewMain.bottomAnchor, constant: 50),
            authorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            
            nameMusicLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10),
            nameMusicLabel.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
            
            favouritesButton.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: -10),
            favouritesButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            musicSlider.topAnchor.constraint(equalTo: nameMusicLabel.bottomAnchor, constant: 30),
            musicSlider.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            musicSlider.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            minuteStartLabel.topAnchor.constraint(equalTo: musicSlider.bottomAnchor, constant: 10),
            minuteStartLabel.leadingAnchor.constraint(equalTo: musicSlider.leadingAnchor),
            
            minuteFinishLabel.topAnchor.constraint(equalTo: minuteStartLabel.topAnchor),
            minuteFinishLabel.trailingAnchor.constraint(equalTo: musicSlider.trailingAnchor),
            
            buttonStack.topAnchor.constraint(equalTo: minuteFinishLabel.bottomAnchor, constant: 32),
            buttonStack.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }
}



