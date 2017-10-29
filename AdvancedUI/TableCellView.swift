//
//  TableCellView.swift
//  AdvancedUI
//
//  Created by Razalon on 29/10/2017.
//  Copyright © 2017 wojgas. All rights reserved.
//

import UIKit

class TableCellView: UITableViewCell {

    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
