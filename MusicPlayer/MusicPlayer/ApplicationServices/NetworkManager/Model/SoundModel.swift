//
//  SoundModel.swift
//  MusicPlayer
//
//  Created by Александр Косяков on 13.01.2023.
//

import Foundation

// MARK: - SoundNetwork
struct SoundNetwork: Codable {
    let toptracks: Toptracks?
}

// MARK: - Toptracks
struct Toptracks: Codable {
    let track: [Track]?
    let attr: ToptracksAttr?

    enum CodingKeys: String, CodingKey {
        case track
        case attr = "@attr"
    }
}

// MARK: - ToptracksAttr
struct ToptracksAttr: Codable {
    let artist: ArtistEnum?
    let page, perPage, totalPages, total: String?
}

enum ArtistEnum: String, Codable {
    case cher = "Cher"
}

// MARK: - Track
struct Track: Codable {
    let name, playcount, listeners, mbid: String?
    let url: String?
    let streamable: String?
    let artist: ArtistClass?
    let image: [Image]?
    let attr: TrackAttr?

    enum CodingKeys: String, CodingKey {
        case name, playcount, listeners, mbid, url, streamable, artist, image
        case attr = "@attr"
    }
}

// MARK: - ArtistClass
struct ArtistClass: Codable {
    let name: ArtistEnum?
    let mbid: String?
    let url: String?
}

// MARK: - TrackAttr
struct TrackAttr: Codable {
    let rank: String?
}

// MARK: - Image
struct Image: Codable {
    let text: String?
    let size: Size?

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size
    }
}

enum Size: String, Codable {
    case extralarge = "extralarge"
    case large = "large"
    case medium = "medium"
    case small = "small"
}
