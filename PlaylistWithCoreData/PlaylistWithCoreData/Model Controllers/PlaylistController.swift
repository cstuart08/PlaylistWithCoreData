//
//  PlaylistController.swift
//  PlaylistWithCoreData
//
//  Created by Cameron Stuart on 8/7/19.
//  Copyright © 2019 Cameron Stuart. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    // Singleton - to ensure we only interact with one playlist at a time
    static let sharedInstance = PlaylistController()
    
    // Local Source of Truth
    var playlists: [Playlist] {
        // "<Playlist>" allows us to specify what type of Object we are trying to fetch data from.
        // This is for safety.
        let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        return (try?CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    func createPlaylistWith(name: String) {
        _ = Playlist(name: name)
        print("Called the createPlaylistWith function")
        saveToPersistentStore()
    }
    
    func deletePlaylist(playlist: Playlist) {
        CoreDataStack.context.delete(playlist)
        print("Called the deletePlaylist function")
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error saving to persistent store in Function: \(#function): \(error.localizedDescription)")
        }
    }
}
