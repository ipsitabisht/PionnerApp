//
//  ViewController.swift
//  PioneerApp
//
//  Created by Vivian Huang on 7/14/20.
//  Copyright © 2020 Vivian Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
 
   
    @IBOutlet var modelButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        modelButton.forEach { (button) in UIView.animate(withDuration: 0.3, animations: {
            button.isHidden = !button.isHidden
            })
    }
    
}
}
