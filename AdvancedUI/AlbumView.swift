//
//  AlbumView.swift
//  AdvancedUI
//
//  Created by Razalon on 29/10/2017.
//  Copyright © 2017 wojgas. All rights reserved.
//

import UIKit

class AlbumView: UITableViewController {

    
    var album: Album = Album()
    var index: Int = 0
    var max: Int = 0
    

    @IBOutlet weak var artistField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var genreField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var tracksField: UITextField!
    @IBOutlet weak var saveRecordButton: UIButton!
    @IBOutlet weak var deleteRecordButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveRecordButton.isEnabled = false
        setTextFields()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setTextFields() {
        yearField.text = String(album.year)
        tracksField.text = String(album.tracks)
        artistField.text = album.artist
        titleField.text = album.album
        genreField.text = album.genre
    }
    
    func setCD() {
        album.artist = artistField.text!
        album.album = titleField.text!
        album.genre = genreField.text!
        if let year = Int(yearField.text!) {
            album.year = year
        }
        if let tracks = Int(yearField.text!) {
            album.tracks = tracks
        }
    }
    
    @IBAction func onTextFieldChanged(_ sender: UITextField) {
        saveRecordButton.isEnabled = true
    }


}
