//
//  DepenseTableViewCell.swift
//  Gestionnaire d'argent
//
//  Created by Julien 安 on 2019/1/2.
//  Copyright © 2019年 if26. All rights reserved.
//

import UIKit

class DepenseTableViewCell: UITableViewCell {
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
