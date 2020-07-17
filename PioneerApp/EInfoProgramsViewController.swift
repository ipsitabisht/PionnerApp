//
//  EInfoProgramsViewController.swift
//  PioneerApp
//
//  Created by Not Tanu on 7/16/20.
//  Copyright © 2020 Vivian Huang. All rights reserved.
//

import UIKit

class EInfoProgramsViewController: UIViewController {
    var previousVC = EProgramsTableTableViewController()
    var selectedProgram = Programs()

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var whatLabel: UILabel!
    @IBOutlet weak var whereLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = selectedProgram.name
        whatLabel.text = selectedProgram.what
        whereLabel.text = selectedProgram.loc
        costLabel.text = selectedProgram.cost
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        nameLabel.text = "❤️" + selectedProgram.name
        selectedProgram.name = "❤️" + selectedProgram.name
        
          
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
