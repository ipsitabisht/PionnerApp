//
//  SProgramsTableViewController.swift
//  PioneerApp
//
//  Created by Not Tanu on 7/16/20.
//  Copyright © 2020 Vivian Huang. All rights reserved.
//

import UIKit

class SProgramsTableViewController: UITableViewController {
    var programs : [Programs] = []
    
    func createPrograms() -> [Programs]{
        let LHS = Programs()
        LHS.name = "Lawrence Hall Of Science Volunteer"
        LHS.what = "What: Facilitating hands on activities in exhibits and helping the staff around the Lawrence of Sciences"
        LHS.loc = "Where: Berkeley, California"
        LHS.cost = "Cost: Free"
        
        let NSLC = Programs()
        NSLC.name =  "National Student Leadership Conference"
        NSLC.what = "What: A precollege summer program where students do hands on activities and experience life on campus. Program includes leadership training, guest speakers, and exclusive college tours."
        NSLC.loc = "Where: Multiple locations"
        NSLC.cost = "Cost: $2595 to $5795"
        
        let lmuES = Programs()
        lmuES.name = "Loyola Marymount University Environmental Science"
        lmuES.what = "What: A two week field ecology course where students can learn about the wetlands in the Ballona Wetlands and study complex socio-ecological challenges."
        lmuES.loc = "Where: Los Angeles, California"
        lmuES.cost = "Cost: $2460"
        
        let barnard = Programs()
        barnard.name = "Barnard Steminists in Training Program"
        barnard.what = "What: Geared toward high school girls who are interested in developing STEM skill through lectures and doing things hands-on."
        barnard.loc = "Where: New York, New York"
        barnard.cost = "Cost: $2997"
        
        return [LHS, NSLC, lmuES, barnard]
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
        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let program = programs[indexPath.row]
        
        performSegue(withIdentifier: "moveToInfo", sender: program)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let infoProgramsVC = segue.destination as? SInfoProgramsViewController {
            if let program = sender as? Programs{
                infoProgramsVC.selectedProgram = program
                infoProgramsVC.previousVC = self
            }
          
        }
    }
    

}
