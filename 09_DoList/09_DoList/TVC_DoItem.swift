//
//  TVC_DoItem.swift
//  09_DoList
//
//  Created by Dogukan Berk Ozer on 24.01.2022.
//

import UIKit

class TVC_DoItem: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
