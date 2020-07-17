//
//  TProgramsTableViewController.swift
//  PioneerApp
//
//  Created by Not Tanu on 7/16/20.
//  Copyright © 2020 Vivian Huang. All rights reserved.
//

import UIKit

class TProgramsTableViewController: UITableViewController {
    
    var programs : [Programs] = []
    
    func createPrograms() -> [Programs]{
        let kwk = Programs()
        kwk.name = "Kode With Klossy"
        kwk.what = "What: A 2 week coding camp for 13-18 year olds where you can learn how to code either mobile apps or websites, founded by Karlie Kloss."
        kwk.loc = "Where: All around the US: check the website if there’s one near you!"
        kwk.cost = "Cost: Free"
        
        let gwc = Programs()
        gwc.name = "Girls Who Code"
        gwc.what = "What: Clubs for grades 3-12 girls to learn how to code and summer programs at different companies for rising 10th-12th graders to learn how to code."
        gwc.loc = "Where: multiple locations"
        gwc.cost = "Cost: Summer programs are $299, and other programs are at varying costs"
        
        let gDev = Programs()
        gDev.name = "Girl Develop It"
        gDev.what = "What: Classes and camps teaching girls 9-18 how to build with power tools and screen print to convey a message."
        gDev.loc = "Where: San Francisco, Washington DC, Chicago, Detroit, New York"
        gDev.cost = "Cost:Classes and Camps for High Schoolers are free, and pre high-school girls classes are $350 and camps are $525 (scholarships available)"
        
        return [kwk, gwc, gDev]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        programs = createPrograms()
        
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
        if let infoProgramsVC = segue.destination as? TInfoProgramsViewController {
            if let program = sender as? Programs{
                infoProgramsVC.selectedProgram = program
                infoProgramsVC.previousVC = self
            }
          
        }
    }
   

}
