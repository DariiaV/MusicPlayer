//
//  FavouritesView.swift
//  MusicPlayer
//
//  Created by Александр Косяков on 09.01.2023.
//

import UIKit

final class FavouritesView: UIView {
    
    // MARK: - UI Elements
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    lazy var favoritesButton : UIButton = {
        
        let button = UIButton ()
        button.setImage(UIImage(named: "heart 1"), for: .normal)
        button.backgroundColor = .gray
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 23
        return button
    }()
    
    lazy var imageViewFavorites: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "contact")
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var menuButton : UIButton = {
        
        let button = UIButton ()
        button.setImage(UIImage(named: "menu"), for: .normal)
        button.backgroundColor = .gray
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 23
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        addSybView()
        setupConstraints()
        
        tableView.register(FavouritiesCell.self, forCellReuseIdentifier: "CellID")
        tableView.rowHeight = 65
        tableView.backgroundColor = .black
        tableView.separatorColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Setup Constrains

extension FavouritesView {
    
    func addSybView() {
        
        addSubview(favoritesButton)
        addSubview(imageViewFavorites)
        addSubview(menuButton)
        addSubview(tableView)
        
        favoritesButton.translatesAutoresizingMaskIntoConstraints = false
        imageViewFavorites.translatesAutoresizingMaskIntoConstraints = false
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            favoritesButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: .favoritesButtonTopAnchor),
            favoritesButton.heightAnchor.constraint(equalToConstant:.sizeAnchor),
            favoritesButton.widthAnchor.constraint(equalToConstant:.sizeAnchor),
            favoritesButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: .sizeAnchor),
            
            imageViewFavorites.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageViewFavorites.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            menuButton.topAnchor.constraint(equalTo: favoritesButton.topAnchor),
            menuButton.heightAnchor.constraint(equalToConstant:.sizeAnchor),
            menuButton.widthAnchor.constraint(equalToConstant:.sizeAnchor),
            menuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -.sizeAnchor),
            
            tableView.topAnchor.constraint(equalTo: imageViewFavorites.bottomAnchor,constant: .sizeAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
}

// MARK: - Constant Constraints

private extension CGFloat {
  
    static let favoritesButtonTopAnchor: CGFloat = 40
    static let widthHeightAnchor: CGFloat = 45
    static let sizeAnchor: CGFloat = 1
}

