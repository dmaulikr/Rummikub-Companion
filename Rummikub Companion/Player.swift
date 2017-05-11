//
//  Player.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 14/03/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit

class Player{
    
    //MARK:Properties
    
    var score : Score
    var name : String
    
    
    //MARK:Methods
    
    init(name: String){
        self.name = name
        self.score = Score()
    }
    
    
}
