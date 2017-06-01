//
//  ReviewScoresVC.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 29/05/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit

class ReviewScoresVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var players = [Player]()
    
    @IBOutlet weak var scoreBoardTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scoreBoardTableView.delegate = self
        self.scoreBoardTableView.dataSource = self
        self.scoreBoardTableView.reloadData()
        
    }
    
    //MARK: TableView DataSource and Delegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerScoreTableViewCell", for: indexPath) as! PlayerScoreTableViewCell
        
        cell.playerNameLbl.text = self.players[indexPath.row].name
            
        cell.playerScoreLbl.text = "\(self.players[indexPath.row].score.total)"
        
        return cell
        
    }
    
    //MARK: Methods
    @IBAction func nextRoundBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ReviewScoresVCturnsVC", sender: self.players)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? turnsVC{
            if let players = sender as? [Player]{
                destination.players = players   
            }
        }
    }
    
    
}
