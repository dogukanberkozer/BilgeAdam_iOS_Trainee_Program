//
//  VC_Home.swift
//  09_LocalData
//
//  Created by Dogukan Berk Ozer on 20.01.2022.
//

import UIKit

class VC_Home: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    
    var welcome : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblWelcome.text = welcome
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
