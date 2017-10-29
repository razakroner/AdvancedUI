//
//  Album.swift
//  AdvancedUI
//
//  Created by Razalon on 29/10/2017.
//  Copyright © 2017 wojgas. All rights reserved.
//


import Foundation

class Album {
    
    var artist: String
    var genre: String
    var album: String
    var year: Int
    var tracks: Int
    
    init() {
        artist = ""
        genre = ""
        album = ""
        year = 0
        tracks = 0
    }
    
    init(_ data: [String: Any]) {
        self.artist = data["artist"] as! String
        self.genre = data["genre"] as! String
        self.album = data["album"] as! String
        self.year = data["year"] as! Int
        self.tracks = data["tracks"] as! Int
    }
    
//    func isEqual(to: Album) -> Bool {
//        if year == to.year &&
//            tracks == to.tracks &&
//            artist == to.artist &&
//            genre == to.genre &&
//            album == to.album {
//            return true
//        }
//        return false
//    }
    
}
