//
//  EProgramsTableTableViewController.swift
//  PioneerApp
//
//  Created by Not Tanu on 7/16/20.
//  Copyright © 2020 Vivian Huang. All rights reserved.
//

import UIKit

class EProgramsTableTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        programs = createPrograms()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func createPrograms() -> [Programs]{
        let girlGarage = Programs()
        girlGarage.name = "Girls Garage"
        girlGarage.what = "What: Classes and camps teaching girls 9-18 how to build with power tools and screen print to convey a message."
        girlGarage.loc = "Where: Berkeley, California"
        girlGarage.cost = "Cost: Classes and Camps for High Schoolers are free, and pre high-school girls classes are $350 and camps are $525 (scholarships available)"
        
        let umdEngineering = Programs()
        umdEngineering.name = "University of Maryland Women in Engineering"
        umdEngineering.what = "What: A one-week summer program for rising 11th and 12th grader girls who are considering engineering as a possible major and career. It allows girls to explore the world of engineering through hands-on activities, laboratory experiments, informative workshops, team challenges and seminars with professional engineers."
        umdEngineering.loc = "Where: College Park, Maryland"
        umdEngineering.cost = "Cost: $1300"
        
        let jhEI = Programs()
        jhEI.name = "John Hopkins EI"
        jhEI.what = "What: A summer course that gives high school students an opportunity to apply their skills to engineering hands-on."
        jhEI.loc = "Where: John Hopkins University Homewood campus in Baltimore, MD and at other locations in Maryland, California, the District of Columbia, Ohio, and Pennsylvania"
        jhEI.cost = "Cost: $2965-7500 depending on location and if it is commuter or residential"

        let SWE = Programs()
        SWE.name = "SWE Invent it. Build it"
        SWE.what = "What: A hands-on engineering program with members of the Society of Women Engineers for middle school and high school girls that allows girls to explore "
        SWE.loc = "Where: many locations"
        SWE.cost = "Cost: depends on location"
        
        return [girlGarage, umdEngineering, jhEI, SWE]
    }
    
    var programs : [Programs] = []
    

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
          if let infoProgramsVC = segue.destination as? EInfoProgramsViewController {
            if let program = sender as? Programs{
                infoProgramsVC.selectedProgram = program
                infoProgramsVC.previousVC = self
            }
          
        }
    }
   

}
