//
//  TableViewController.swift
//  SearchTableViewController
//
//  Created by admin on 8/2/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    
    let data =  ["Cho", "Meo", "Khi", "Voi", "Ca Heo", "Ca Voi"]
    var animals: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        animals = data

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return animals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = animals[indexPath.row]
        return cell
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        animals = searchText.isEmpty ? data : data.filter({(dataString: String) -> Bool in
//            return dataString.range(of: searchText, options: .caseInsensitive) != nil
            return dataString.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }

}
