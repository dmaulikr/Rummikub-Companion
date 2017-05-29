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
    var runningRemainingPiecesArr = [Int](repeatElement(0, count: 2))//will have subscript respective to players and hold the respective running remaining pieces value
    var winner = Int()
    var _currentPlayerForCalc = Int()
    var currentPlayerForCalc : Int{
        get{
            return _currentPlayerForCalc
        }set{
            self._currentPlayerForCalc = newValue
            self.totalRemainingPtsLbl.text = String(runningRemainingPiecesArr[newValue])
        }
    }
    
    @IBOutlet weak var playerNameLbl: UILabel!
    @IBOutlet weak var totalRemainingPtsLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var finishBtn: UIButton!
    
    
    

    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize currentPlayerForCalc
        currentPlayerForCalc = 0
        
        //initialize runningRemainingPiecesArr
        runningRemainingPiecesArr = [Int](repeatElement(0, count: players.count))
        
        // turn autoresizing on for playerNameLbl
        playerNameLbl.autoresizingMask = UIViewAutoresizing(rawValue: 1)
        
        //check if the first player in arr is the winner
        //if so, skip it
        if currentPlayerIsTheWinner(){
            currentPlayerForCalc += 1
        }
        
        //set top label with first loser player's name
        playerNameLbl.text = "\(players[currentPlayerForCalc].name)"
        
        //if there's only 2 players, disable nextBtn
        if players.count == 2{
            self.nextBtn.isHidden = true
            self.finishBtn.isHidden = false
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
        self.currentPlayerForCalc -= 1
        playerNameLbl.text = players[currentPlayerForCalc].name
        if self.currentPlayerIsTheFirst(){
            self.previousBtn.isEnabled = false
        }
        if self.nextBtn.isHidden && !currentPlayerIsTheLast(){
            self.nextBtn.isHidden = false
            self.finishBtn.isHidden = true
        }
    }
    
    @IBAction func resetBtnPressed(_ sender: UIButton) {
        self.resetTotalRemaining()
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        self.currentPlayerForCalc += 1
        playerNameLbl.text = players[currentPlayerForCalc].name
        if self.currentPlayerIsTheLast(){
            self.nextBtn.isHidden = true
            self.finishBtn.isHidden = false
        }
        if !self.previousBtn.isEnabled && !currentPlayerIsTheFirst(){
            self.previousBtn.isEnabled = true
        }
    }
    
    @IBAction func finishBtnPressed(_ sender: UIButton) {
        for (index, element) in self.players.enumerated(){
            if index != self.winner{
               element.score.subtract(value: self.runningRemainingPiecesArr[index])
               self.players[self.winner].score.add(value: self.runningRemainingPiecesArr[index])
            }
        }
        
        performSegue(withIdentifier: "calculateScoreVCReviewScoreVC", sender: players)
    }
    
    func resetTotalRemaining(){
        runningRemainingPiecesArr[currentPlayerForCalc] = 0
        self.totalRemainingPtsLbl.text = "0"
    }
    
    func addRemainingPiecesForCurrentPlayer(value : Int){
        runningRemainingPiecesArr[currentPlayerForCalc] += value
        totalRemainingPtsLbl.text = String(runningRemainingPiecesArr[currentPlayerForCalc])
    }
    
    func currentPlayerIsTheLast() -> Bool{
        if currentPlayerForCalc == players.count - 1{
            return true
        }else{
            return false
        }
    }
    
    func currentPlayerIsTheFirst() -> Bool{
        if currentPlayerForCalc == 0{
            return true
        }else{
            return false
        }
    }
    
    func currentPlayerIsTheWinner() -> Bool{
        if currentPlayerForCalc == winner{
            return true
        }else{
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ReviewScoresVC{
            if let players = sender as? [Player]{
                destination.players = players
                print("prepared sucessfully")
            }
        }
    }
    
}


