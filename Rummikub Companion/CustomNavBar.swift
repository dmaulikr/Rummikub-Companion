//
//  CustomNavBar.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 02/07/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit

class CustomNavBar: UINavigationBar {

    override func awakeFromNib() {
        self.setBackgroundImage(UIImage(named: "CustomNavbarBg.png"), for: .default)
        self.frame.size.height = CGFloat(integerLiteral: 60)
        self.setTitleVerticalPositionAdjustment(CGFloat(integerLiteral: 8), for: .default)
        self.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Baskerville", size: 21)!, NSForegroundColorAttributeName: UIColor.white]
    }

}
