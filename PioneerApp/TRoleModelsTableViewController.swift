//
//  TRoleModelsTableViewController.swift
//  PioneerApp
//
//  Created by Not Tanu on 7/16/20.
//  Copyright © 2020 Vivian Huang. All rights reserved.
//

import UIKit

class TRoleModelsTableViewController: UITableViewController {
    var roleModels : [RoleModel] = []
    
    func createRoleModels() -> [RoleModel]{
        let gHopper = RoleModel()
        gHopper.name = "Grace Hopper"
        gHopper.bio = "Grace Brewster Murray Hopper was an American computer scientist and United States Navy rear admiral. One of the first programmers of the Harvard Mark I computer, she was a pioneer of computer programming who invented one of the first linkers."
        
        let aLove = RoleModel()
        aLove.name = "Ada Lovelace"
        aLove.bio = "Augusta Ada King, Countess of Lovelace was an English mathematician and writer, chiefly known for her work on Charles Babbage's proposed mechanical general-purpose computer, the Analytical Engine."
        
        let mHamilton = RoleModel()
        mHamilton.name = "Margaret Hamilton"
        mHamilton.bio = "Margaret Heafield Hamilton is an American computer scientist, systems engineer, and business owner. She was director of the Software Engineering Division of the MIT Instrumentation Laboratory, which developed on-board flight software for NASA's Apollo program."
        
        let kJohnson  = RoleModel()
        kJohnson.name = "Katherine Johnson"
        kJohnson.bio = "Katherine Johnson was an American mathematician whose calculations of orbital mechanics as a NASA employee were critical to the success of the first and subsequent U.S. crewed spaceflights."
        
        let dVaug = RoleModel()
        dVaug.name = "Dorothy Johnson Vaughan"
        dVaug.bio = "Dorothy Johnson Vaughan was an American mathematician and human computer who worked for the National Advisory Committee for Aeronautics, and NASA, at Langley Research Center in Hampton, Virginia."
        
        return [gHopper, aLove, mHamilton, kJohnson, dVaug]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        roleModels = createRoleModels()
        
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

    
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let infoRMVC = segue.destination as? TInfoRMViewController {
            if let roleModel = sender as? RoleModel{
                infoRMVC.selectedRM = roleModel
                infoRMVC.previousVC = self
            }
          
        }
        
    }
    

}
