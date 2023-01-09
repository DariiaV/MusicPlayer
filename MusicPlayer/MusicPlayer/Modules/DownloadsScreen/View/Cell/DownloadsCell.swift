//
//  DownloadsCell.swift
//  MusicPlayer
//
//  Created by Александр Косяков on 09.01.2023.
//

import UIKit

final class DownloadsCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    lazy var imageViewCell: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imageCell")
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var performerMusicLabelCell : UILabel = {
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.white.cgColor, UIColor.blue.cgColor]
        let label = UILabel()
        label.text = "Dailamo Dailamo"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    lazy var nameMusicLabelCell : UILabel = {
        
        let label = UILabel()
        label.text = "Sangeethe Rajeswaran,Vijay Annoty"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()
        
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSybViewCell()
        setupConstraintsCell()
        contentView.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Constrains

extension DownloadsCell {
    
    func addSybViewCell() {
        
        contentView.addSubview(imageViewCell)
        contentView.addSubview(performerMusicLabelCell)
        contentView.addSubview(nameMusicLabelCell)
    
        imageViewCell.translatesAutoresizingMaskIntoConstraints = false
        performerMusicLabelCell.translatesAutoresizingMaskIntoConstraints = false
        nameMusicLabelCell.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraintsCell() {
        
        NSLayoutConstraint.activate([
            imageViewCell.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            imageViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            imageViewCell.heightAnchor.constraint(equalToConstant:65),
            imageViewCell.widthAnchor.constraint(equalToConstant:65),
            
            performerMusicLabelCell.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 15),
            performerMusicLabelCell.leadingAnchor.constraint(equalTo: imageViewCell.leadingAnchor,constant: 90),
            
            nameMusicLabelCell.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 42),
            nameMusicLabelCell.leadingAnchor.constraint(equalTo: imageViewCell.leadingAnchor,constant: 90),
        ])
    }
}

