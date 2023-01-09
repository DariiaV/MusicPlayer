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
    
    lazy var performerMusicLabel : UILabel = {
        
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
        button.setTitleColor(UIColor.blue, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        return button
    }()
    
    lazy var leftButton : UIButton = {
        
        let button = UIButton ()
        button.setImage(UIImage(named: "left 1"), for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        return button
    }()
    
    lazy var rightButton : UIButton = {
        
        let button = UIButton ()
        button.setImage(UIImage(named: "right 1"), for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        return button
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
        
        addSubview(imageViewMain)
        addSubview(performerMusicLabel)
        addSubview(nameMusicLabel)
        addSubview(favouritesButton)
        addSubview(musicSlider)
        addSubview(playButton)
        addSubview(leftButton)
        addSubview(rightButton)
        addSubview(minuteStartLabel)
        addSubview(minuteFinishLabel)
        
     
        imageViewMain.translatesAutoresizingMaskIntoConstraints = false
        performerMusicLabel.translatesAutoresizingMaskIntoConstraints = false
        nameMusicLabel.translatesAutoresizingMaskIntoConstraints = false
        favouritesButton.translatesAutoresizingMaskIntoConstraints = false
        musicSlider.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        minuteStartLabel.translatesAutoresizingMaskIntoConstraints = false
        minuteFinishLabel.translatesAutoresizingMaskIntoConstraints = false
    }
     
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageViewMain.topAnchor.constraint(equalTo: self.topAnchor,constant: 120),
            imageViewMain.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -30),
            imageViewMain.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 30),
            imageViewMain.heightAnchor.constraint(equalToConstant: 350),

            performerMusicLabel.topAnchor.constraint(equalTo: self.imageViewMain.topAnchor,constant: 185),
            performerMusicLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -30),
            performerMusicLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            performerMusicLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            nameMusicLabel.topAnchor.constraint(equalTo: self.performerMusicLabel.topAnchor,constant: 60),
            nameMusicLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -30),
            nameMusicLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            nameMusicLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            favouritesButton.topAnchor.constraint(equalTo: self.imageViewMain.topAnchor,constant: 450),
            favouritesButton.heightAnchor.constraint(equalToConstant:30),
            favouritesButton.widthAnchor.constraint(equalToConstant:30),
            favouritesButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            
            musicSlider.topAnchor.constraint(equalTo: self.nameMusicLabel.topAnchor,constant: 55),
            musicSlider.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            musicSlider.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            musicSlider.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            playButton.topAnchor.constraint(equalTo: self.musicSlider.topAnchor,constant: 270),
            playButton.heightAnchor.constraint(equalToConstant:65),
            playButton.widthAnchor.constraint(equalToConstant:65),
            playButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            leftButton.topAnchor.constraint(equalTo: self.musicSlider.topAnchor,constant: 280),
            leftButton.heightAnchor.constraint(equalToConstant:40),
            leftButton.widthAnchor.constraint(equalToConstant:40),
            leftButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 100),
            
            rightButton.topAnchor.constraint(equalTo: self.musicSlider.topAnchor,constant: 280),
            rightButton.heightAnchor.constraint(equalToConstant:40),
            rightButton.widthAnchor.constraint(equalToConstant:40),
            rightButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -100),
            
            minuteStartLabel.topAnchor.constraint(equalTo: self.musicSlider.topAnchor,constant: 240),
            minuteStartLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            
            minuteFinishLabel.topAnchor.constraint(equalTo: self.musicSlider.topAnchor,constant: 240),
            minuteFinishLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            
        ])
    }
}



