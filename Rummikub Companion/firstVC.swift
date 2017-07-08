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
        
        //Manage actions according to Core Data existing data
        if !self.people.isEmpty{
            let alertController = UIAlertController(title: "New Game Warning", message: "All previous game score will be deleted!", preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "Delete 😎", style: .default) { (action:UIAlertAction!) in
                
                //Delete existing data from database
                
                guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
                    return
                }
                
                //Create Managed Object Context
                let managedObjectContext = appDelegate.persistentContainer.viewContext
                
                // Create Fetch Request
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
                
                // Create Batch Delete Request
                let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
                
                do {
                    try managedObjectContext.execute(batchDeleteRequest)
                    
                } catch {
                    // Error Handling
                }
                
                
                self.performSegue(withIdentifier: "newGameVC", sender:sender)
                
            }
            
            let cancelAction = UIAlertAction(title: "Nope 😅", style: .default, handler: nil)
            
            alertController.addAction(OKAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)

        }else{
            self.performSegue(withIdentifier: "newGameVC", sender:sender)
        }
        
    }
    
    @IBAction func continueGameBtnPressed(_ sender: UIButton) {
       self.performSegue(withIdentifier: "FirstVCReviewScoresVC", sender: self.players)
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
        if let destination = segue.destination as? ReviewScoresVC{
            if let players = sender as? [Player]{
                destination.players = players
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

//for making the keyboard hide
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
