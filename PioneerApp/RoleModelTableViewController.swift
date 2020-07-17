//
//  RoleModelTableViewController.swift
//  PioneerApp
//
//  Created by Not Tanu on 7/16/20.
//  Copyright © 2020 Vivian Huang. All rights reserved.
//

import UIKit

class RoleModelTableViewController: UITableViewController {
    
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
    
    
    //CREATED AN ARRAY FOR OBJECTS
   var roleModels : [RoleModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CALLS FUNCTION
        roleModels = createRoleModel()
      
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

    //sets up the cells in TABLE VIEW CONTROLLER
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let roleModel = roleModels[indexPath.row]
        
        cell.textLabel?.text = roleModel.name
        
        return cell
    }
    
    
    //PERFORMS SEGUE TO INFO PAGE ON ROLE MODELS
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let roleModel = roleModels[indexPath.row]
        
        performSegue(withIdentifier: "moveToInfo", sender: roleModel)
        
    }

 
    
    // MARK: - Navigation

   //SENDS OBJECT INFO WHEN OBJECT IS SELCTED TO GO TO NEW INFO PAGE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let infoRMVC = segue.destination as? InfoOnRMViewController{
            if let  roleModel = sender as? RoleModel{
                infoRMVC.selectedRM  = roleModel
                infoRMVC.previousVC = self
            }
        }
        
    }
    
    


}
