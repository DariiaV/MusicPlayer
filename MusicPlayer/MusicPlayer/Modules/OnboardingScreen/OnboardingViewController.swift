//
//  OnboardingFirstViewController.swift
//  MusicPlayer
//
//  Created by Дария Григорьева on 08.01.2023.
//

import UIKit
class OnboardingViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "OnboardingFirst")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to the world of music"
        label.font = UIFont(name: "Marker Felt", size: 24)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .white
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "We are a small boutique music venue in the heart of..."
        label.font = UIFont(name: "Marker Felt", size: 16)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .white
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(goNextStep(_:)), for: .touchUpInside)
        button.layer.insertSublayer(createGradientToNextButton(), at: 0)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    private var isNextButtonTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setupView()
        setupNavigationItem()
    }
    
    private func setupView() {
        view.addSubviews([imageView, welcomeLabel, descriptionLabel, nextButton])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 225),
            imageView.heightAnchor.constraint(equalToConstant: 207),
            imageView.widthAnchor.constraint(equalToConstant: 207),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 8),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nextButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 49),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -29),
            nextButton.widthAnchor.constraint(equalToConstant: 66),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    private func setupNavigationItem() {
        let rightItem = UIBarButtonItem(title: "Skip",
                                        image: nil,
                                        target: self,
                                        action: #selector(skipOnboarding))
        rightItem.tintColor = .white
        navigationItem.rightBarButtonItem = rightItem
    }
    
    private func createGradientToNextButton() -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        let firstColor = UIColor(named: "OnboardingNextButtonColor1") ?? .red
        let secondColor = UIColor(named: "OnboardingNextButtonColor2") ?? .red
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: 66, height: 40)
        
        return gradient
    }
    
    @objc private func skipOnboarding() {
        // next screen
        dismiss(animated: true)
    }
    
    @objc private func goNextStep(_ sender: UIButton) {
        if isNextButtonTapped {
            skipOnboarding()
        } else {
            imageView.image = UIImage(named: "OnboardingSecond")
            nextButton.setTitle("Start", for: .normal)
            welcomeLabel.text = "Download and save your Favourit Music"
            descriptionLabel.text = "Your best music is always with you 🎧"
            navigationItem.rightBarButtonItem?.isHidden = true
            isNextButtonTapped = true
        }
    }
    
}
