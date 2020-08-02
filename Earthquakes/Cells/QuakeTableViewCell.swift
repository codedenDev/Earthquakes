//
//  QuakeTableViewCell.swift
//  Earthquakes
//
//  Created by Richard Kelly on 02/08/2020.
//  Copyright © 2020 Richard Kelly. All rights reserved.
//

import UIKit

class QuakeTableViewCell: UITableViewCell {

    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
