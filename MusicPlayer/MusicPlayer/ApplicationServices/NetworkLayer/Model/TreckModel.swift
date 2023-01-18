//
//  Result.swift
//  MusicPlayer
//
//  Created by Админ on 14.01.2023.
//

import Foundation


struct AlbumResult: Decodable {
    let results: [TrackModel]
}

struct TrackModel: Decodable {
    let artistName: String
    let artistId: Int?
    let artworkUrl100: String?
    let previewUrl: String?
    let trackTimeMillis: Int? // delete to 60000 -> minutes
    let trackName: String?
}
