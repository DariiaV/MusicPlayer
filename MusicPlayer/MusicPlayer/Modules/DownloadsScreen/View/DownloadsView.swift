//
//  DownloadsView.swift
//  MusicPlayer
//
//  Created by Александр Косяков on 09.01.2023.
//

import UIKit

final class DownloadsView: UIView {
    
    // MARK: - UI Elements
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        addSybView()
        setupConstraints()
        
        tableView.register(DownloadsCell.self, forCellReuseIdentifier: "CellID")
        tableView.rowHeight = 75
        tableView.backgroundColor = .black
        tableView.separatorColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Setup Constrains

extension DownloadsView {
    
    func addSybView() {
        
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
          
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant:.tableViewTopAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

// MARK: - Constant Constraints

private extension CGFloat {
  
    static let tableViewTopAnchor: CGFloat = 25
}



    
