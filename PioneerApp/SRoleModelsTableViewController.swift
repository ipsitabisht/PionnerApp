//
//  SRoleModelsTableViewController.swift
//  PioneerApp
//
//  Created by Not Tanu on 7/16/20.
//  Copyright © 2020 Vivian Huang. All rights reserved.
//

import UIKit

class SRoleModelsTableViewController: UITableViewController {
    var roleModels : [RoleModel] = []
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        roleModels = createRoleModel()
    }
    
    func createRoleModel() -> [RoleModel]{
        let marieC = RoleModel()
        marieC.name = "Marie Curie"
        marieC.bio = "Marie Curie was a physicist, chemist and a pioneer in the study of radiation. She and her husband, Pierre, discovered the elements polonium and radium. They and Henri Becquerel were awarded the Nobel Prize in Physics in 1903, and Marie received the Nobel Prize in Chemistry in 1911."
        
        let janakiA = RoleModel()
        janakiA.name = "Janaki Ammal"
        janakiA.bio = "Janaki Ammal Edavalath Kakkat was an Indian botanist who worked on plant breeding, cytogenetics and phytogeography. Her most notable work involved studies on sugarcane and the eggplant but she also worked on the cytogenetics of a range of plants and co-authored the Chromosome Atlas of Cultivated Plants with C.D."
        
        let cWu = RoleModel()
        cWu.name  = "Chien-Shiung Wu"
        cWu.bio = "Chien-Shiung Wu was a Chinese-American experimental physicist who made significant contributions in the field of nuclear physics. Wu worked on the Manhattan Project, where she helped develop the process for separating uranium into uranium-235 and uranium-238 isotopes by gaseous diffusion."
        
        let rFranklin = RoleModel()
        rFranklin.name = "Rosalind Franklin"
        rFranklin.bio = "Rosalind Elsie Franklin was an English chemist and X-ray crystallographer whose work was central to the understanding of the molecular structures of DNA, RNA, viruses, coal, and graphite."
        let pSab = RoleModel()
        pSab.name = "Pardis Sabeti"
        pSab.bio = "Pardis Sabeti is an Iranian-American computational biologist, medical geneticist and evolutionary geneticist.[2] She developed a bioinformatic statistical method which identifies sections of the genome that have been subject to natural selection and an algorithm which explains the effects of genetics on the evolution of disease."
        
        return [marieC, janakiA, cWu, rFranklin, pSab]

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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let roleModel = roleModels[indexPath.row]
        
        performSegue(withIdentifier: "moveToInfo", sender: roleModel)
        
    }


  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let infoRMVC = segue.destination as? SInfoRMViewController{
            if let  roleModel = sender as? RoleModel{
                infoRMVC.selectedRM  = roleModel
                infoRMVC.previousVC = self
            }
        }
    }
   

}
