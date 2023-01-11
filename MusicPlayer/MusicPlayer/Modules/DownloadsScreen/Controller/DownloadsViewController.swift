//
//  DownloadsViewController.swift
//  MusicPlayer
//
//  Created by Александр Косяков on 09.01.2023.
//

import UIKit

class DownloadsViewController: UIViewController {
    
    // MARK: - Properties
    
    private let downloadsView = DownloadsView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = downloadsView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Downloads"
        setupDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
       
    }
    
    // MARK: - Private Method
    
    private func setupDelegate() {
        downloadsView.tableView.dataSource = self
        downloadsView.tableView.delegate = self
      
    }
}

// MARK: - TableViewDataSource

extension DownloadsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as? DownloadsCell  else {
            fatalError("Creating cell from HotelsListViewController failed")
        }
        
        return cell
    }
}

// MARK: - TableViewDelegate

extension DownloadsViewController: UITableViewDelegate {
}
