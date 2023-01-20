//
//  FavouritesViewController.swift
//  MusicPlayer
//
//  Created by Александр Косяков on 09.01.2023.
//

import UIKit
import AVFoundation

final class FavouritesViewController: UIViewController {
    
    // MARK: - Properties
    
    private let favouritesView = FavouritesView()
    private var trackSound = [TrackModel]()
    private let soundViewController = SoundLayerController()
    private let soundView = SoundLayerView()
    private var trackList = [TrackModel]()
    
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
     
        cell.data = items[indexPath.item]

        return cell
    }
}

// MARK: - TableViewDelegate

extension FavouritesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
          
        }
    }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            let soundVC = SoundLayerController()

            soundVC.data = trackList[indexPath.row]
            navigationController?.pushViewController(soundVC, animated: true)
                    
        }
    }

