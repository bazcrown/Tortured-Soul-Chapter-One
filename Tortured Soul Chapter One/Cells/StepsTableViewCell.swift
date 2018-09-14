//
//  StepsTableViewCell.swift
//  Tortured Soul Chapter One
//
//  Created by Michael Moore on 8/5/18.
//  Copyright © 2018 Bazzy Studios. All rights reserved.
//

import UIKit

class StepsTableViewCell: UITableViewCell {

    @IBOutlet weak var stepCountLabel: UILabel!
    @IBOutlet weak var stepTitleLabel: UILabel!
    @IBOutlet weak var stepDescriptionTextView: UITextView!
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
