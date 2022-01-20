//
//  VC_ProductDetail.swift
//  08_Ecommerce
//
//  Created by Dogukan Berk Ozer on 19.01.2022.
//

import UIKit

class VC_ProductDetail: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = Bundle.main.loadNibNamed("TBC_ProductDetail", owner: self, options: nil)?.first as! TBC_ProductDetail
        
        
        
        return cell
    }

}
