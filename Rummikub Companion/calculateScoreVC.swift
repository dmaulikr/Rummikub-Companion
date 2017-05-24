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
    var runningRemainingPiecesArr = [Int]()
    var winner = Int()
    var currentPlayerForCalc = 0 //begin calculating with the first player
    
    @IBOutlet weak var playerNameLbl: UILabel!
    @IBOutlet weak var totalRemainingPtsLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    

    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize runningRemainingPiecesArr
        runningRemainingPiecesArr = [Int](repeatElement(0, count: players.count))
        
        // turn autoresizing on for playerNameLbl
        playerNameLbl.autoresizingMask = UIViewAutoresizing(rawValue: 1)
        
        //check if the first player in arr is the winner
        //if so, skip it
        if currentPlayerForCalc == winner{
            currentPlayerForCalc += 1
        }
        
        //set top label with first loser player's name
        playerNameLbl.text = "Enter all \(players[currentPlayerForCalc].name)'s"
        
        //if there's only 2 players, disable nextBtn
        if players.count == 2{
            self.nextBtn.isEnabled = false
        }
        
        //disable previousBtn since this is the first loser player
        self.previousBtn.isEnabled = false
        
    }
    
    @IBAction func valueBtnPressed(_ sender: UIButton) {
        if let value = Int((sender.titleLabel?.text)!){
            addRemainingPiecesForCurrentPlayer(value: value)
            print(runningRemainingPiecesArr[currentPlayerForCalc])
        }
        
    }
    
    @IBAction func jokerBtnPressed(_ sender: UIButton) {
        addRemainingPiecesForCurrentPlayer(value: 10)
    }
    
    @IBAction func prevBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func resetBtnPressed(_ sender: UIButton) {
        self.resetTotalRemaining()
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
    }
    
    func resetTotalRemaining(){
        runningRemainingPiecesArr[currentPlayerForCalc] = 0
        totalRemainingPtsLbl.text = "0"
    }
    
    func addRemainingPiecesForCurrentPlayer(value : Int){
        runningRemainingPiecesArr[currentPlayerForCalc] += value
        totalRemainingPtsLbl.text = String(runningRemainingPiecesArr[currentPlayerForCalc])
    }
    
}


