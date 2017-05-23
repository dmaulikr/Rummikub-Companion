//
//  winnerVC.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 15/05/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit

class winnerVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    //MARK:: Properties
    @IBOutlet weak var winnerPickerView: UIPickerView!
    
    var players = [Player]()
    var winner = Int()
    var info = [Any?]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set winnerPickerView DataSource and delegate
        winnerPickerView.delegate = self
        winnerPickerView.dataSource = self
        //Set winnerPickerView Default winner
        winnerPickerView.selectedRow(inComponent: 0)
        
    }
    
    //MARK: PickerView DataSource and Delegate
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return players.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return players[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        winner = row
    }
    @IBAction func backBtnPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func calculateRoundScoreBtnPressed(_ sender: UIButton) {
        info = [players, winner]
        performSegue(withIdentifier: "winnerVCcalculateScoreVC", sender: info)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Passing Players and winner to calculateScoreVC
        if let destination = segue.destination as? calculateScoreVC{
            if let info = sender as? [Any?] {
                var info2 = info
                if let winner = info2.popLast() as? Int{
                    destination.winner = winner
                }
                if let players = info2.popLast() as? [Player]{
                    destination.players = players
                }
            
            }
        }
    }
}
