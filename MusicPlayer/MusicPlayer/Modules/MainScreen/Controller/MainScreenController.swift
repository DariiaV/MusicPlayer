//
//  File.swift
//  MusicPlayer
//
//  Created by Nikita Borisov on 09.01.2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    private let mainView = MainScreenView()
    
    var trecks = [TrackModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTreck(treckName: "оборотень+лис")
        view.backgroundColor = .black
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
    }
    
    override func loadView() {
        super.loadView()
        self.view = mainView
        
    }
    
//    private func makeRequest() {
//
//        var request = URLRequest(url:URL(string: "https://itunes.apple.com/search?term=оборотень+лис&entity=song&media=music")!)
//
//            request.httpMethod = "GET"
//
//            let task = URLSession.shared.dataTask(with: request) { data, response, error in
//                print(String(decoding: data!, as: UTF8.self))
//                print(error)
//            }
//            task.resume()
//        }
    
    
    func fetchTreck(treckName: String) {

        //let url = "https://itunes.apple.com/search?term=\(treckName)&entity=song&media=music"
        
        let url =  "https://itunes.apple.com/search?term=\(treckName)&entity=song&media=music"

        print(url)
        
        NetworkDataFetch.shared.fetchTreck(urlString: url) { [weak self] treckName, error in

            if error == nil {


                guard let treckName = treckName else {return}

                self?.trecks = treckName.results
    
                print(treckName.results)
               

            } else {
                print(error!.localizedDescription)
            }
        }

    }
    
    
}

extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DitailPlaylistViewCell.indetifire, for: indexPath) as? DitailPlaylistViewCell else {
            return UICollectionViewCell()
        }
        
        cell.layer.cornerRadius = 20
        
        return cell
    }
    
    
    
}

extension MainScreenViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 2.2, height: collectionView.frame.width / 2)
        
    }
}

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicTableViewCell.indetifire, for: indexPath) as? MusicTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120

    }
    
    
    
    
    
    
}


