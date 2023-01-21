//
//  TableViewController.swift
//  Presidents
//
//  Created by Georgios Loulakis on 21/1/23.
//

import UIKit

class TableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    // 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //2
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return presidents.count
    }

    //3
    // Name of label & detail label
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycellidentifier", for: indexPath)
        
      
        cell.textLabel?.text = presidents[indexPath.row][.name]
        cell.detailTextLabel?.text = presidents[indexPath.row][.years]
        
        guard presidents.count > indexPath.row
        else {
            print("Error with presidents row")
            return cell
        }

        return cell
    }
    
    //4
    // how to add title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return nil
        case 1:
            return nil
        case 2:
            return "My second Section"
        default:
            return "Error"
        }
    }
    
    //5
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showPresidentsDetailsSegue", sender: self.tableView.cellForRow(at: indexPath))
    }
    

    //10
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {return}
        
        switch segueIdentifier {
        case "showPresidentsDetailsSegue":
            // take destination controller
            guard let destinationController = segue.destination as? DetailsViewController else {return}
            // take cell
            guard let selectedCell = sender as? UITableViewCell else {return}
            // add name
            destinationController.presidentName = selectedCell.textLabel?.text ?? ""
        default:
            return
        }
        
    }
    
    
    
}
