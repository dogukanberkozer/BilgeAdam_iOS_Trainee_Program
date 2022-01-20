//
//  TVC_Categories.swift
//  08_Ecommerce
//
//  Created by Dogukan Berk Ozer on 19.01.2022.
//

import UIKit

class TVC_Categories: UITableViewCell {

    @IBOutlet weak var lblCategoryName: UILabel!
    @IBOutlet weak var imgCategory: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
