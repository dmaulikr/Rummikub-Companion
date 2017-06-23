//
//  ReviewScoresVC.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 29/05/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit
import CoreData

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
    
    //MARK: Actions
    @IBAction func nextRoundBtnPressed(_ sender: UIButton) {
        
        for p : Player in players{
            save(player: p)
        }
        
        self.performSegue(withIdentifier: "ReviewScoresVCturnsVC", sender: self.players)
    }

    
    //MARK: Functions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? turnsVC{
            if let players = sender as? [Player]{
                destination.players = players   
            }
        }
    }
    
    func save(player:Player){
        
        //this var will hold the fetched data from Core Data
        var people : [NSManagedObject] = []
        
        //tell whether data was fetched from Core Data or not
        var hasPlayers = false
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        //filter for fetchRequest
        let predicate = NSPredicate(format: "name = %@", player.name)
        
        fetchRequest.predicate = predicate
        
        do {
            people = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!
        
        
        //check is data was fetched
        if !people.isEmpty{
            hasPlayers = true
            
        }
        
        
        if !hasPlayers{
            //create player in Core Data if it doesn't exist yet
            
            let person = NSManagedObject(entity: entity, insertInto: managedContext)
            
            person.setValue(player.name, forKey: "name")
            
            person.setValue(player.score.total, forKey: "score")
        }else{
            //update player score if player already exist
            for p:NSManagedObject in people{
                if p.value(forKey: "name") as! String == player.name{
                    p.setValue(player.score.total, forKey: "score")
                }
            }
        }
        
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    
}
