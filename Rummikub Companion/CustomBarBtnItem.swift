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
        self.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Baskerville", size: 21)!, NSForegroundColorAttributeName: UIColor.white], for: controlState)
        
        //self.customView?.bounds = CGRect(x: self.customView.bounds.c, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>)
    }

}
