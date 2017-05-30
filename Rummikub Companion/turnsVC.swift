//
//  turnsVC.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 08/05/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit
import AVFoundation

class turnsVC: UIViewController {
    //MARK: Properties
    @IBOutlet weak var countingLabel: UILabel!
    
    let turnTime = 120
    var seconds = Int()
    var timer = Timer()
    var isTimeRunning = false
    var paused = false
    let systemSoundID: SystemSoundID = 1007
    
    var players = [Player]()
    
    

    override func viewDidLoad() {
        
        seconds = turnTime
        
        super.viewDidLoad()
        

    }
    

    //MARK: Methods
    @IBAction func startButtonPressed(_ sender: UIBarButtonItem) {
        if !isTimeRunning{
            runTimer()
        }else{
            if paused{
                runTimer()
                paused = false
            }
        }
    }
    @IBAction func pauseButtonPressed(_ sender: UIBarButtonItem) {
        if !paused {
            timer.invalidate()
            self.paused = true
        }
    }
    @IBAction func resetButtonPressed(_ sender: UIBarButtonItem) {
        resetTimer()
    }
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(turnsVC.updateTimer)), userInfo: nil, repeats: true)
        isTimeRunning = true
    }
    
    func updateTimer(){
        if seconds <= 0{
            AudioServicesPlaySystemSound (systemSoundID)
            
            let alertController = UIAlertController(title: "Time's up!", message: "The current player's turn has finished.", preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                print("you have pressed OK button");
            }
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true, completion:{
                self.resetTimer()
            })
        }else{
            seconds-=1
            countingLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%01i:%02i", minutes, seconds)
    }
    
    func resetTimer(){
        timer.invalidate()
        seconds = turnTime
        countingLabel.text = timeString(time: TimeInterval(seconds))
        isTimeRunning = false

    }
    
    @IBAction func backBtnPressed(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "TurnsVCFirstVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? winnerVC{
            if let players = sender as? [Player]{
                destination.players = players
            }
        }
    }
    
    @IBAction func finishRoundBtnPressed(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "turnsVCwinnerVC", sender: players)
    }
    
    

}
