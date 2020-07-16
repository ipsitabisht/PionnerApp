//
//  RoleModelTableViewController.swift
//  PioneerApp
//
//  Created by Not Tanu on 7/16/20.
//  Copyright © 2020 Vivian Huang. All rights reserved.
//

import UIKit

class RoleModelTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        roleModels = createRoleModel()
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
        return roleModels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let roleModel = roleModels[indexPath.row]
        
        cell.textLabel?.text = roleModel.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let roleModel = roleModels[indexPath.row]
        
        performSegue(withIdentifier: "moveToInfo", sender: roleModel)
        
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
        if let infoRMVC = segue.destination as? InfoOnRMViewController{
            if let  roleModel = sender as? RoleModel{
                infoRMVC.selectedRM  = roleModel
                infoRMVC.previousVC = self
            }
        }
        
    }
    
    
    func createRoleModel() -> [RoleModel]{
        //all the role models that show up in the rows in the table view controller
        
        let edithClarke = RoleModel()
        edithClarke.name  = "Edith Clarke"
        edithClarke.bio = "Edith Clarke was the first female engineer to achieve professional standing in Tau Beta Pi. In 1948, Clarke was the first female Fellow of the American Institute of Electrical Engineers. She was the first woman to be accepted as a full voting member in the American Institute of Electrical Engineers."
        let aprilleEricssonJackson = RoleModel()
        aprilleEricssonJackson.name = "Aprille Ericsson-Jackson"
        aprilleEricssonJackson.bio = "Ericsson-Jackson is the first African-American woman to receive a Ph.D. in mechanical engineering from Howard University and the first African-American woman to receive a Ph.D. in Engineering at the National Aeronautics and Space Administration (NASA) Goddard Space Flight Center "
        let ellenOchoa = RoleModel()
        ellenOchoa.name = "Ellen Ochoa"
        ellenOchoa.bio = "Ellen Ochoa is an American engineer, former astronaut and former director of the Johnson Space Center. In 1993 Ochoa became the first Hispanic woman to go to space when she served on a nine-day mission aboard the Space Shuttle Discovery. "
        let hedyLamarr = RoleModel()
        hedyLamarr.name = "Hedy Lamarr"
        hedyLamarr.bio = "Hedy Lamarr was an Austrian-American actress and inventor who pioneered the technology that would one day form the basis for today’s WiFi, GPS, and Bluetooth communication systems. As a natural beauty seen widely on the big screen in films like Samson and Delilah and White Cargo, society has long ignored her inventive genius.   "
        return [edithClarke , aprilleEricssonJackson , ellenOchoa, hedyLamarr ]
    }
    
    var roleModels : [RoleModel] = []

}
