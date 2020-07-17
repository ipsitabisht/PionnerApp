//
//  TInfoRMViewController.swift
//  PioneerApp
//
//  Created by Not Tanu on 7/16/20.
//  Copyright © 2020 Vivian Huang. All rights reserved.
//

import UIKit

class TInfoRMViewController: UIViewController {
    var previousVC = TRoleModelsTableViewController()
    var selectedRM = RoleModel()
  
    @IBOutlet weak var bioLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = selectedRM.name
        bioLabel.text = selectedRM.bio

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTappedButton(_ sender: Any) {
        nameLabel.text = "💜" + selectedRM.name
        selectedRM.name = "💜" + selectedRM.name
        
          
           previousVC.tableView.reloadData()
           navigationController?.popViewController(animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
