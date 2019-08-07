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
    
    static let sharedInstance = PlaylistController()
    
    var playlists: [Playlist] {
        let moc = CoreDataStack.context
        let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        return (try? moc.fetch(fetchRequest)) ?? []
    }
    
    func createPlaylistWith(name: String) {
        _ = Playlist(name: name)
        print("Called createPlaylistWith function")
        saveToPersistentStore()
    }
    
    func deletePlaylist(playlist: Playlist) {
        let moc = CoreDataStack.context
        moc.delete(playlist)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        
        do {
            try moc.save()
        } catch {
            print("Error saving to persistent store. \(error.localizedDescription)")
        }
    }
    
    
    
    
}
