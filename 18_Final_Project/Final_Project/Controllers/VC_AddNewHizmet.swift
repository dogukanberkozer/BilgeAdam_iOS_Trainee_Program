//
//  VC_AddNewHizmet.swift
//  Final_Project
//
//  Created by Sait Cihaner on 4.02.2022.
//

import UIKit
import FirebaseDatabase

class VC_AddNewHizmet: UIViewController {
    var ref : DatabaseReference!
    var hizmet : Hizmet? = nil
   
    @IBOutlet weak var aciklamaTxt: UITextField!
    @IBOutlet weak var baslikTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        self.aciklamaTxt.text = hizmet?.aciklama
        self.baslikTxt.text = hizmet?.baslik
    }
    
    @IBAction func addHizmet(_ sender: Any) {
        
        if hizmet == nil{
            let currentUserId = ViewController.currentUserId
           
            
            
            let u : [String : Any] = [
                
                "baslik": baslikTxt.text!,
                "aciklama" : aciklamaTxt.text!
                    
                ]
            self.ref.child("User").child(ViewController.currentUserId!).child("hizmetler").childByAutoId().setValue(u)
        }
        else{
            guard let key = ref.child("User").child(ViewController.currentUserId!).child("hizmetler").childByAutoId().key else { return }
                                                                                                                    
            let post = ["baslik": self.baslikTxt.text!,
                        "aciklama": self.aciklamaTxt.text!
                       ]
                                                                                                            
            
            let childUpdates = ["/User/\(ViewController.currentUserId!)/hizmetler/\(key)": post,
                                ]
            ref.updateChildValues(childUpdates)
            
        }
        
       
        
        
      
      
        
        self.navigationController?.popViewController(animated: true)
    }
    

}
