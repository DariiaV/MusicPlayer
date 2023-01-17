//
//  NetworkDataFetch.swift
//  MusicPlayer
//
//  Created by Админ on 14.01.2023.
//

import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    
    private init() {}
    
    
    func fetchTreck(urlString: String, responce: @escaping(AlbumResult?, Error?) -> Void) {
        
        NetworkRequest.shared.requestData(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let trecks = try JSONDecoder().decode(AlbumResult.self, from: data)
                    responce(trecks, nil)
                    
                } catch let jsonError{
                    print("jsonError")
                }
            case .failure(let error):
                print("ERROOROOR:  \(error.localizedDescription)")
                responce(nil, error)
            }
        }
    }
    
    
}

