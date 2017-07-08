//
//  PieceButton.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 02/07/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit

class PieceButton: UIButton {

    
    override func draw(_ rect: CGRect) {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red:0.13, green:0.45, blue:0.99, alpha:1.0).cgColor
        
    }
 

}
