//
//  Round.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 15/03/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit

class Round{
    //MARK:Properties
    var winner : Player?
    var players : [Player]?
    
    //MARK:Methods
    func addPlayer(player : Player){
        self.players?.append(player)
    }
    
}
