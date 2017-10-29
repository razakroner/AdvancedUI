//
//  BaseTableViewController.swift
//  AdvancedUI
//
//  Created by Razalon on 29/10/2017.
//  Copyright © 2017 wojgas. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    var data: [Album] = []
    var ndex: Int = 0
    var max: Int = 0
    
    let url = URL(string: "https://isebi.net/albums.php")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getAlbumData(url)
    }
    
    func getAlbumData(_ uri : URL?){
        if let url = uri {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let usableData = data {
                    let data = try! JSONSerialization.jsonObject(with: usableData, options: []) as! [Any];
                    for iter in data {
                        if let obj = iter as? [String: Any] {
                            self.data.append(Album(obj))
                        }
                    }
                    self.max = self.data.endIndex-1
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            task.resume()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableCellView

        cell.albumLabel.text = data[indexPath.row].album
        cell.artistLabel.text = data[indexPath.row].artist
        cell.yearLabel.text = String(data[indexPath.row].year)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let Album = data[indexPath.row]
                let detail = (segue.destination as! UINavigationController).topViewController as! AlbumView
                
                detail.album = Album
                detail.index = indexPath.row
                detail.max = data.endIndex
                detail.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                detail.navigationItem.leftItemsSupplementBackButton = true
            }
        } else if segue.identifier == "addNew" {
            let detail = (segue.destination as! UINavigationController).topViewController as! AlbumView
            detail.album = Album()
            detail.index = data.endIndex
            detail.max = data.endIndex+1
            detail.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
            detail.navigationItem.leftItemsSupplementBackButton = true
            data.append(Album())
            max += 1
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
}
