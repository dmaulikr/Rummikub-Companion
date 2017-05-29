//
//  ReviewScoresVC.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 29/05/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit

class ReviewScoresVC: UIViewController {
    
    var players = [Player]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("debug")
        for p : Player in players {
            print("\(p.name) : \(p.score.getTotal())")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
