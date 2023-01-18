//
//  TopCountryCell.swift
//  MusicPlayer
//
//  Created by Дария Григорьева on 18.01.2023.
//

import UIKit

class TopCountryCell: UITableViewCell {
    
    private let imageTrack: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
    }()
    
    private let nameArtistLabel: UILabel = {
        let label = UILabel()
        label.text = "Artist"
        label.textColor = .white
        label.textAlignment = .left
        
        label.font = UIFont(name: "Noteworthy Bold", size: 17)
        return label
    }()
    
    private let nameTrackLabel: UILabel = {
        let label = UILabel()
        label.text = "Track"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont(name: "Noteworthy", size: 13)
        return label
    }()
    
    private let timeTrackLabel: UILabel = {
        let label = UILabel()
        label.text = "3.56"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Noteworthy", size: 13)
        return label
    }()
    
    private let playTrack: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "play")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        configure()
        
        activityIndicator.color = .cyan
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageTrack.image = nil
    }
    
    func setup(nameArtist: String?, nameTrack: String?, minutesTrack: Int?, imageURL: String?) {
        nameArtistLabel.text = nameArtist
        nameTrackLabel.text = nameTrack
        if let minutesTrack {
            timeTrackLabel.text = String(format: "%.2f", Double(minutesTrack) / 60000)
        }
        guard let imageURL else {
            return
        }
        
        NetworkManager.shared.downloadImage(from: imageURL) { image in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.imageTrack.image = image
            }
        }
    }
    
    private func configure() {
        backgroundColor = .clear
        contentView.addSubviews([imageTrack,
                                 nameArtistLabel,
                                 nameTrackLabel,
                                 playTrack])
        imageTrack.addSubviews([activityIndicator])
        activityIndicator.startAnimating()
        
        NSLayoutConstraint.activate([
            imageTrack.topAnchor.constraint(equalTo: topAnchor, constant: .leadingMargin),
            imageTrack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .leadingMargin),
            imageTrack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .trailingMargin),
            imageTrack.widthAnchor.constraint(equalTo: imageTrack.heightAnchor),
            
            nameArtistLabel.topAnchor.constraint(equalTo: imageTrack.topAnchor),
            nameArtistLabel.leadingAnchor.constraint(equalTo: imageTrack.trailingAnchor, constant: .leadingMargin),
            
            nameTrackLabel.topAnchor.constraint(equalTo: nameArtistLabel.bottomAnchor, constant: .nameTrackTopMargin),
            nameTrackLabel.leadingAnchor.constraint(equalTo: imageTrack.trailingAnchor, constant: .leadingMargin),
            nameTrackLabel.trailingAnchor.constraint(equalTo: playTrack.leadingAnchor, constant: .trailingMargin),
            nameTrackLabel.bottomAnchor.constraint(equalTo: imageTrack.bottomAnchor),
            
            playTrack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .trailingMargin),
            playTrack.centerYAnchor.constraint(equalTo: centerYAnchor),
            playTrack.heightAnchor.constraint(equalToConstant: .playTrackHeight),
            playTrack.widthAnchor.constraint(equalToConstant: .playTrackHeight),
        
            activityIndicator.centerXAnchor.constraint(equalTo: imageTrack.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: imageTrack.centerYAnchor),
        ])
    }
}

private extension CGFloat {
    static let leadingMargin: CGFloat = 10
    static let trailingMargin: CGFloat = -10
    static let nameArtistTopMargin: CGFloat = 20
    static let nameTrackTopMargin: CGFloat = 5
    static let timeTrackTopMargin: CGFloat = 5
    static let playTrackHeight: CGFloat = 40
}
