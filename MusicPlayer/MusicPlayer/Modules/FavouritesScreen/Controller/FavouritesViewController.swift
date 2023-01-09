//
//  FavouritesViewController.swift
//  MusicPlayer
//
//  Created by Александр Косяков on 09.01.2023.
//

import UIKit

final class FavouritesViewController: UIViewController {
    
    // MARK: - Properties
    
    private let favouritesView = FavouritesView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = favouritesView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegate()
    }
    
    // MARK: - Private Method
    
    private func setupDelegate() {
        favouritesView.tableView.dataSource = self
        favouritesView.tableView.delegate = self
      
    }
}

// MARK: - TableViewDataSource

extension FavouritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as? FavouritiesCell  else {
            fatalError("Creating cell from HotelsListViewController failed")
        }
        
      
        return cell
    }
}

// MARK: - TableViewDelegate

extension FavouritesViewController: UITableViewDelegate {
    
}


