//
//  BodyPartCell.swift
//  Tortured Soul Chapter One
//
//  Created by Michael Moore on 8/3/18.
//  Copyright © 2018 Bazzy Studios. All rights reserved.
//

import UIKit
class BodyPartListItem {
    var text: String
    var checked: Bool
    init(text: String, checked: Bool) {
        self.text = text
        self.checked = checked
    }
    func toggleChecked(){
        checked = !checked
    }
}
class BodyPartCell: UITableViewCell {

    @IBOutlet weak var bodyPartLabel: UILabel!
    @IBOutlet weak var checkedLabel: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
