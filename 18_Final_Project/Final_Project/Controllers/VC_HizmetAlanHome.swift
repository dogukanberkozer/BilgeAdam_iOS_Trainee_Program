//
//  VC_HizmetAlanHome.swift
//  Final_Project
//
//  Created by Sait Cihaner on 4.02.2022.
//

import UIKit
import Firebase

class VC_HizmetAlanHome: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        do {
                 try Auth.auth().signOut()
           performSegue(withIdentifier: "goToLoginFromHizmetAlan", sender: self)
              } catch{
                  print("error")
              }
        
        // Do any additional setup after loading the view.
    }
  
}
