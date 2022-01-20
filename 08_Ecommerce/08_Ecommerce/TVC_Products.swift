//
//  TVC_Products.swift
//  08_Ecommerce
//
//  Created by Dogukan Berk Ozer on 19.01.2022.
//

import UIKit

class TVC_Products: UITableViewCell {
    
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblOldPrice: UILabel?
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
