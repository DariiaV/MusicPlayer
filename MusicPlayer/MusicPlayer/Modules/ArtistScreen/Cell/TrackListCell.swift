//
//  TrackListCell.swift
//  MusicPlayer
//
//  Created by Дария Григорьева on 18.01.2023.
//

import UIKit

class TrackListCell: UITableViewCell {
    
    private let trackLabel: UILabel = {
        let label = UILabel()
        label.text = "Track"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont(name: "Noteworthy", size: 17)
        return label
    }()
    
    private let playTrack: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "play")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(nameTrack: String?) {
        trackLabel.text = nameTrack
    }
    
    private func configure() {
        backgroundColor = .black
        addSubviews([trackLabel, playTrack])
        
        NSLayoutConstraint.activate([
            trackLabel.topAnchor.constraint(equalTo: topAnchor),
            trackLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            trackLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .leadingMargin),
            trackLabel.trailingAnchor.constraint(equalTo: playTrack.leadingAnchor, constant: .trailingMargin),
            
            playTrack.centerYAnchor.constraint(equalTo: centerYAnchor),
            playTrack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .trailingMargin),
            playTrack.heightAnchor.constraint(equalToConstant: .playTrackHeight),
            playTrack.widthAnchor.constraint(equalToConstant: .playTrackHeight),
        ])
    }
}

private extension CGFloat {
    static let leadingMargin: CGFloat = 10
    static let trailingMargin: CGFloat = -10
    static let playTrackHeight: CGFloat = 20
}
