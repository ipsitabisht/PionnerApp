//
//  MProgramsTableViewController.swift
//  PioneerApp
//
//  Created by Not Tanu on 7/16/20.
//  Copyright © 2020 Vivian Huang. All rights reserved.
//

import UIKit

class MProgramsTableViewController: UITableViewController {

    var programs : [Programs] = []
    
    func createPrograms() -> [Programs] {
        let agAm = Programs()
        agAm.name = "All Girls, All Math"
        agAm.what = "What: A week-long camp for girls in grades 10-12 that develops their math skills and allows them to stay in a residence hall."
        agAm.loc = "Where: University of Lincoln Nebraska"
        agAm.cost = "Cost: $350-$1200"
        
        let campE = Programs()
        campE.name = "Camp Euclid"
        campE.what = "What: A six week online math camp for teenagers younger than 19 years old that allows them to encounter unsolved problems."
        campE.loc = "Where: Online"
        campE.cost = "Cost: $1200 (grants available"
        
        return [agAm, campE]
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        programs = createPrograms()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return programs.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let program = programs[indexPath.row]
        cell.textLabel?.text = program.name

        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let program = programs[indexPath.row]
        
        performSegue(withIdentifier: "moveToInfo", sender: program)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let infoProgramsVC = segue.destination as? MInfoProgramsViewController {
            if let program = sender as? Programs{
                infoProgramsVC.selectedProgram = program
                infoProgramsVC.previousVC = self
            }
          
        }
    }


}
