//
//  Song+Convenience.swift
//  PlaylistWithCoreData
//
//  Created by Cameron Stuart on 8/7/19.
//  Copyright © 2019 Cameron Stuart. All rights reserved.
//

import Foundation
import CoreData

extension Song {
    
    convenience init(title: String, artist: String, playlist: Playlist, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        
        self.title = title
        self.artist = artist
        self.playlist = playlist
    }
}
