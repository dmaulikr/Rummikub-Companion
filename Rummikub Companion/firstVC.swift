//
//  ViewController.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 14/03/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit

class firstVC: UIViewController {
    
    //MARK:Actions
    @IBAction func newGamePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "newGameVC", sender:sender)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

