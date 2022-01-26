//
//  TVC_Contact.swift
//  10_Contacts_V2
//
//  Created by Dogukan Berk Ozer on 25.01.2022.
//

import UIKit

class TVC_Contact: UITableViewCell {

    @IBOutlet weak var ivPp: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSurname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
