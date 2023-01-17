//
//  Result.swift
//  MusicPlayer
//
//  Created by Админ on 14.01.2023.
//

import Foundation


struct AlbumResult: Decodable {
    let resultCount: Int
    let results: [TrackModel]
}

struct TrackModel: Decodable {
    
    let trackId: Int
    let trackName: String
    let artistName: String
    let albumName: String?
    let coverURL: String?
    let previewURL: String?
    let artworkUrl60: String?
    let artworkUrl100: String?
}
