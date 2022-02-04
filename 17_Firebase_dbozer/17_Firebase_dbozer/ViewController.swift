//
//  ViewController.swift
//  17_Firebase_dbozer
//
//  Created by Dogukan Berk Ozer on 3.02.2022.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {

    @IBOutlet weak var tfUser: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    var ref : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
        
//        ref.child("Products").child("1").observe(.value) { snapsot in
//
//            print("OBSERVE")
//            print(snapsot)
//        }
//
//        ref.child("Products").child("1").getData { error, dss in
//
//            print("GET DATA")
//            print(dss)
//        }
    }

    @IBAction func btnAdd_TUI(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: tfUser.text!, password: tfPassword.text!) { authResult, error in
          
            print(authResult?.user)
            
            Auth.auth().signIn(withEmail: self.tfUser.text!, password: self.tfPassword.text!) { [weak self] authResult, error in
              guard let strongSelf = self else { return }
              
                print("==== GIRIS BASARILI =====")
            }
        }
        
    }
    
    @IBAction func btnAddSecond(_ sender: Any) {
        
        let u : [String : Any] =
        [
            "Id" : "1",
            "Title" : "product1",
            "Price" : 77
        ]
        
        ref.child("Products").child(u["Id"] as! String).setValue(u)
    }
    
    
}

