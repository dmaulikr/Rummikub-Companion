//
//  newGameVC.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 15/03/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit

class newGameVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {

    //MARK:Properties
    @IBOutlet weak var numberOfPlayersPickerView: UIPickerView!
    
    @IBOutlet weak var playersNamesTableView: UITableView!
    
    @IBOutlet weak var doneButton: UIButton!
    
    var players = [Player]()
    
    //Data shown on numberOfPlayersPickerView
    let numberOfPlayersPickerViewData = ["2", "3", "4"]
    
    //Number of rows in playersNamesTableView
    var numberOfRowsPlayersNamesTableView = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set numberOfPlauersPickerView delegate and DataSource
        self.numberOfPlayersPickerView.delegate = self
        self.numberOfPlayersPickerView.dataSource = self
        
        //Select 2 players for default # of players
        self.numberOfPlayersPickerView.selectedRow(inComponent: 0)
        
        //Set default size for playersNamesTableView
        playersNamesTableView.bounds.size.height = CGFloat(90)
            
        //Set playersNamesTableView delegate and DataSource
        self.playersNamesTableView.delegate = self
        self.playersNamesTableView.dataSource = self
        
        //make the keyboard hide
        self.hideKeyboardWhenTappedAround()
        
    }
    
    //MARK: PickerView DataSource and Delegate
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOfPlayersPickerViewData.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numberOfPlayersPickerViewData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        numberOfRowsPlayersNamesTableView = Int(numberOfPlayersPickerViewData[row])!
        playersNamesTableView.bounds.size.height = CGFloat(numberOfRowsPlayersNamesTableView * 45)
        playersNamesTableView.reloadData()
        
        //rearrange next objects
        rearrangePosition(view1: &numberOfPlayersPickerView.frame, view2: &playersNamesTableView.frame)
        rearrangePosition(view1: &playersNamesTableView.frame , view2: &doneButton.frame)
        
    }
    
    
    //MARK: TableView DataSource and Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsPlayersNamesTableView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerNameTableViewCell", for: indexPath) as! PlayerNameTableViewCell
        
        cell.playerNumberLabel.text = "Player \(indexPath.row + 1)"
        
        return cell
    }
    
    //MARK: Methods
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        
        var names = [String]()
        
        //add each player to the array players as Player objects
        if let tableView = self.playersNamesTableView.visibleCells as? [PlayerNameTableViewCell]{
            for c:PlayerNameTableViewCell in tableView{
                if let name = c.playerNameTextField.text{
                    if name != "" && !names.contains(name){
                        names.append(name)
                        self.players.append(Player(name: name))
                    }else{
                        let alert = UIAlertController(title: "Ops...", message: "A Player's name can't be empty or duplicated.", preferredStyle: .alert)
                        
                        let okAction = UIAlertAction(title: "I'll fix it 😅", style: .default, handler: nil)
                        alert.addAction(okAction)
                            
                        self.present(alert, animated: true, completion: {
                            self.players = [Player]()
                            return
                        })
                    }
                    
                }
            }
        }
        
        self.performSegue(withIdentifier: "turnsVC", sender:players)
        
    }
    
    func rearrangePosition(view1: inout CGRect, view2: inout CGRect){
        
        
        let x = view2.origin.x
        let y = view1.origin.y + view1.height
        
        view2.origin = CGPoint(x: x, y: y)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? turnsVC{
            if let players = sender as? [Player]{
                destination.players = players
            }
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
