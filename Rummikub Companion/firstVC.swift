//
//  ViewController.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 14/03/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit
import CoreData


class firstVC: UIViewController {
    //MARK: Properties
    var people : [NSManagedObject] = []
    
    var players : [Player] = []
    
    @IBOutlet weak var continueGameBtn: UIButton!
    
    
    //MARK:Actions
    @IBAction func newGamePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "newGameVC", sender:sender)
    }
    
    @IBAction func continueGameBtnPressed(_ sender: UIButton) {
       self.performSegue(withIdentifier: "FirstVCTurnsVC", sender: self.players)
    }
    
    //MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do {
            people = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        if !self.people.isEmpty{
            self.continueGameBtn.isHidden = false
            
            for p: NSManagedObject in people{
                let player = Player()
                player.name = p.value(forKey: "name") as! String
                player.score.total = p.value(forKey: "score") as! Int
                
                print("\(player.name), \(player.score.total)")
                
                self.players.append(player)
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? turnsVC{
            if let players = sender as? [Player]{
                destination.players = players
            }
        }
    }


}

