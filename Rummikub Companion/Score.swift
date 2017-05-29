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
    var total : Int
    
    //MARK:Methods
    init(){
        self.total = 0
    }
    
    init (total : Int){
        self.total = total
    }
    
    func add(value:Int){
        self.total += value
    }
    
    func subtract(value:Int){
        self.total -= value
    }
    
    func getTotal() -> Int{
        return self.total
    }
}
