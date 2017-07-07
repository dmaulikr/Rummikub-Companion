//
//  CustomBarBtnItem.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 03/07/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit

class CustomBarBtnItem: UIBarButtonItem {
    
    override func awakeFromNib() {
        
        let controlState :UIControlState = .normal
        self.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Helvetica Neue", size: 17)!, NSForegroundColorAttributeName: UIColor.white], for: controlState)
        self.setTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: 8), for: UIBarMetrics.default)
    }
    

}
