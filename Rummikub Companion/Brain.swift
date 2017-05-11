//
//  Brain.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 15/03/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit

class Brain{
    
    func endRound(round : Round){
        if let players = round.players{
            for  p in players{
                if let winner = round.winner{
                    if !(winner === p){
                        
                    }
                }
            }
        }
    }
    
}
