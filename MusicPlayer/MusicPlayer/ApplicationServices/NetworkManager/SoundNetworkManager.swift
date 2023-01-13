//
//  SoundNetworkManager.swift
//  MusicPlayer
//
//  Created by Александр Косяков on 13.01.2023.
//

import UIKit

struct SoundNetworkManager {
    
    private let apiKey = "7ccd58160b2181881b73e9f9726bdac1"
    private let soundURL = "https://api.spoonacular.com/recipes/complexSearch?cuisine=%@&apiKey="
    
    private func makeRequest() {

        var request = URLRequest(url:URL(string: "https://ws.audioscrobbler.com/2.0/?method=artist.gettoptracks&artist=cher&apiKey=&format=json")!)
      
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print(String(decoding: data!, as: UTF8.self))
            print(error)
        }
        task.resume()
    }
    
}
