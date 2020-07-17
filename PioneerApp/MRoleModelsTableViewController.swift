//
//  MRoleModelsTableViewController.swift
//  PioneerApp
//
//  Created by Not Tanu on 7/16/20.
//  Copyright © 2020 Vivian Huang. All rights reserved.
//

import UIKit

class MRoleModelsTableViewController: UITableViewController {
    var roleModels : [RoleModel] = []
    func createRoleModels() -> [RoleModel]{
        let hyp = RoleModel()
        hyp.name = "Hypatia"
        hyp.bio = "Hypatia was a Hellenistic Neoplatonist philosopher, astronomer, and mathematician, who lived in Alexandria, Egypt, then part of the Eastern Roman Empire. She was a prominent thinker of the Neoplatonic school in Alexandria where she taught philosophy and astronomy."
        
        let mMi = RoleModel()
        mMi.name = "Maryam Mirzakhani"
        mMi.bio = "Maryam Mirzakhani was an Iranian mathematician and a professor of mathematics at Stanford University. Her research topics included Teichmüller theory, hyperbolic geometry, ergodic theory, and symplectic geometry."
        
        let sGem = RoleModel()
        sGem.name = "Sophie Germain"
        sGem.bio = "Sophie Germain was a French mathematician, physicist, and philosopher. One of the pioneers of elasticity theory, she won the grand prize from the Paris Academy of Sciences for her essay on the subject. Her work on Fermat's Last Theorem provided a foundation for mathematicians exploring the subject for hundreds of years after"
        
        return [hyp, mMi, sGem]
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        roleModels = createRoleModels()
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
        if let infoRMVC = segue.destination as? MInfoRMViewController {
            if let roleModel = sender as? RoleModel{
                infoRMVC.selectedRM = roleModel
                infoRMVC.previousVC = self
            }
          
        }
    }

}
