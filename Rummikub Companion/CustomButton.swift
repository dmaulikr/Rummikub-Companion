//
//  CustomButton.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 08/07/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override func awakeFromNib() {
        
        self.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 17)
        self.setTitleColor(UIColor(red: 0.0039, green: 0.1373, blue: 0.4353, alpha: 1.0), for: .normal)
        self.autoresizingMask = .flexibleWidth
        
    }
}
