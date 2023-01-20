//
//  FavouritiesCell.swift
//  MusicPlayer
//
//  Created by Александр Косяков on 09.01.2023.
//

import UIKit

protocol FavouritiesCellDelegate: AnyObject {
    func didTapPlayButton(with index: Int?) 
}

final class FavouritiesCell: UITableViewCell {

    weak var delegate: FavouritiesCellDelegate?
    var index: Int?
    
    var data: TrackModel? {
        didSet {
            guard let data = data else { return }
            performerMusicLabelCell.text = data.artistName
            nameMusicLabelCell.text = data.trackName
        }
    }
        
    // MARK: - UI Elements

    lazy var performerMusicLabelCell: UILabel = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.white.cgColor, UIColor.blue.cgColor]
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .right
        label.textColor = .systemMint
        return label
    }()

    lazy var nameMusicLabelCell: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()

    lazy var playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "play"), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(playBut), for: .touchUpInside)
        return button
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

    @objc func playBut() {
        delegate?.didTapPlayButton(with: index)
    }
}

// MARK: - Setup Constrains

extension FavouritiesCell {

    func addSybViewCell() {
        
        contentView.addSubview(performerMusicLabelCell)
        contentView.addSubview(nameMusicLabelCell)
        contentView.addSubview(playButton)
        
        performerMusicLabelCell.translatesAutoresizingMaskIntoConstraints = false
        nameMusicLabelCell.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraintsCell() {
        
        NSLayoutConstraint.activate([
            performerMusicLabelCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            performerMusicLabelCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            nameMusicLabelCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            nameMusicLabelCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            playButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            playButton.heightAnchor.constraint(equalToConstant: 30),
            playButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
}
