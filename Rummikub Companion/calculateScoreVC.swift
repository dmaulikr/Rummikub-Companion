//
//  calculateScoreVC.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 15/05/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit

class calculateScoreVC: UIViewController {
    
    //MARK: Properties
    var players = [Player]()
    var winner = Int()
    var _totalRemaining = 0
    var totalRemaining :Int{
        get{
            return self._totalRemaining
        }set{
            self._totalRemaining = newValue
            self.totalRemainingPtsLbl.text = self._totalRemaining.description
        }
    }
    
    var currentPlayerForCalc = 0 //begin calculating with the first player
    
    @IBOutlet weak var playerNameLbl: UILabel!
    @IBOutlet weak var totalRemainingPtsLbl: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        playerNameLbl.autoresizingMask = UIViewAutoresizing(rawValue: 1) // turn autoresizing on for playerNameLbl
        
        if currentPlayerForCalc == winner{
            currentPlayerForCalc += 1//check if the first player in arr is the winner
        }                         //if so, skip it
        
        playerNameLbl.text = "Enter all \(players[currentPlayerForCalc].name)'s"
    }
    
    //MARK: Methods
    @IBAction func valueBtnPressed(_ sender: UIButton) {
        if let value = Int((sender.titleLabel?.text)!){
            totalRemaining += value
        }
        
    }
    
    @IBAction func jokerBtnPressed(_ sender: UIButton) {
        totalRemaining += 10
    }
    
}


