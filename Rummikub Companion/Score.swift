//
//  Calculator.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 14/03/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit

class Score{
    //MARK:Properties
    private var total : Int
    
    //MARK:Methods
    init(){
        self.total = 0
    }
    
    init (total : Int){
        self.total = total
    }
    
    func add(x:Int){
        self.total += x
    }
    
    func subtract(x:Int){
        self.total -= x
    }
}
