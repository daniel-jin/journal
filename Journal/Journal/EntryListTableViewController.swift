//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Daniel Jin on 12/26/17.
//  Copyright © 2017 Daniel Jin. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)

        let entry = EntryController.shared.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title
        
        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .none)
        }  
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toExistingEntry" {
            
            guard let entryDetailVC = segue.destination as? EntryDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let entry = EntryController.shared.entries[indexPath.row]
            
            entryDetailVC.entry = entry
            
        }
    }

}
