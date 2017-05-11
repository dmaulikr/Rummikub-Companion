//
//  PlayerNameTableViewCell.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 18/03/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit

class PlayerNameTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var playerNumberLabel: UILabel!
    @IBOutlet weak var playerNameTextField: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
