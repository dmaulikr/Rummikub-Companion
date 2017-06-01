//
//  PlayerScoreTableViewCell.swift
//  Rummikub Companion
//
//  Created by Esdras Emanuel on 30/05/17.
//  Copyright © 2017 evtApps. All rights reserved.
//

import UIKit

class PlayerScoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerNameLbl: UILabel!
    
    @IBOutlet weak var playerScoreLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.playerNameLbl.autoresizingMask = UIViewAutoresizing.flexibleWidth
        self.playerScoreLbl.autoresizingMask = UIViewAutoresizing.flexibleWidth
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
