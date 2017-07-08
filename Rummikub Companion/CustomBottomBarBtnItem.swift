//
//  CustomBottomBarBtnItem.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 08/07/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit

class CustomBottomBarBtnItem: UIBarButtonItem {
    
    override func awakeFromNib() {
        
        self.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Helvetica Neue", size: 17)!, NSForegroundColorAttributeName: UIColor(red: 0.0039, green: 0.1373, blue: 0.4353, alpha: 1.0)], for: .normal)
        
        self.tintColor = UIColor(red: 0.0039, green: 0.1373, blue: 0.4353, alpha: 1.0)
        
    }

}
