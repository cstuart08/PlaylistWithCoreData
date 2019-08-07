//
//  SongTableViewController.swift
//  PlaylistWithCoreData
//
//  Created by Cameron Stuart on 8/7/19.
//  Copyright © 2019 Cameron Stuart. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {
    
    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var songArtistTextField: UITextField!
    
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = playlist?.name ?? ""
    }
    
    @IBAction func addSongButton(_ sender: Any) {
        guard let title = songTitleTextField.text,
            let artist = songArtistTextField.text,
            let playlist = self.playlist else { return }
        SongController.sharedInstance.createSongWith(title: title, artist: artist, playlist: playlist)
        tableView.reloadData()
        songTitleTextField.text = ""
        songArtistTextField.text = ""
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playlist?.songs?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)
        
        guard let song = playlist?.songs?.object(at: indexPath.row) as? Song else { return UITableViewCell() }
        
        cell.textLabel?.text = song.title
        cell.detailTextLabel?.text = song.artist
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let song = playlist?.songs?.object(at: indexPath.row) as? Song else { return }
            SongController.sharedInstance.deleteSong(song: song)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
