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
        self.layer.cornerRadius = 40
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 0.0039, green: 0.1373, blue: 0.4353, alpha: 1.0).cgColor
        self.setTitleColor(UIColor(red: 0.0039, green: 0.1373, blue: 0.4353, alpha: 1.0), for: .normal)
        
    }
 

}
