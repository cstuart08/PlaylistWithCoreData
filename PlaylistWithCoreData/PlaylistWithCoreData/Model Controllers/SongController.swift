//
//  SongController.swift
//  PlaylistWithCoreData
//
//  Created by Cameron Stuart on 8/7/19.
//  Copyright © 2019 Cameron Stuart. All rights reserved.
//

import Foundation
import CoreData

class SongController {
    
    static let sharedInstance = SongController()
    
    func createSongWith(title: String, artist: String, playlist: Playlist) {
        let _ = Song(title: title, artist: artist, playlist: playlist)
        PlaylistController.sharedInstance.saveToPersistentStore()
    }
    
    func deleteSong(song: Song) {
        let moc = CoreDataStack.context
        moc.delete(song)
        PlaylistController.sharedInstance.saveToPersistentStore()
    }
}
