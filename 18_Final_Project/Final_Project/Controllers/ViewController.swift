//
//  ViewController.swift
//  Final_Project
//
//  Created by Dogukan Berk Ozer on 3.02.2022.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    var ref : DatabaseReference!
    var userId :String?
  static  var currentUserId : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentUser = Auth.auth().currentUser
        ViewController.currentUserId = currentUser?.uid
        ref = Database.database().reference()
        
     
        
        
                if currentUser != nil  {
                    
                    ref.child("User").child(ViewController.currentUserId!).child("tip").observeSingleEvent(of: .value, with: { snapshot in
                      // Get user value
                        let value = snapshot.value
                     
                        guard let kullaniciTip = KullaniciTipi.init(rawValue: value as! String) else{
                     return
                        }
                        switch kullaniciTip {
                        case .hizmetAlan:
                           
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "VC_HizmetAlanHome") as! VC_HizmetAlanHome
                            self.navigationController?.pushViewController(vc, animated: true)
                        case .hizmetVeren:
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "VC_HizmetVerenHome") as! VC_HizmetVerenHome
                          
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                        
                      // ...
                    }){ error in
                        print(error.localizedDescription)
                      }
               
                                                                                            
      
    }
    }

    @IBAction func btnLogin_TUI(_ sender: Any) {
        
        
        Auth.auth().signIn(withEmail: self.tfEmail.text!, password: self.tfPassword.text!) { [weak self] authResult, error in
            
              
           
                      guard let strongSelf = self else { return }
            if error != nil{
                print(error?.localizedDescription)
                self!.showAlert(msg:"Kullanıcı adı ve şifre uyuşmamaktadır")
            }
            else{
                self?.userId = authResult!.user.uid
                ViewController.currentUserId = authResult!.user.uid
                
                
//                let userID = Auth.auth().currentUser?.uid
                self!.ref.child("User").child(self!.userId!).child("tip").observeSingleEvent(of: .value, with: { snapshot in
                  // Get user value
                    let value = snapshot.value
                 
                    guard let kullaniciTip = KullaniciTipi.init(rawValue: value as! String) else{
                 return
                    }
                    switch kullaniciTip {
                    case .hizmetAlan:
                        
                        let vc = self?.storyboard?.instantiateViewController(withIdentifier: "VC_HizmetAlanHome") as! VC_HizmetAlanHome
                        self?.navigationController?.pushViewController(vc, animated: true)
                    case .hizmetVeren:
                        let vc = self?.storyboard?.instantiateViewController(withIdentifier: "VC_HizmetVerenHome") as! VC_HizmetVerenHome
                        self?.navigationController?.pushViewController(vc, animated: true)
                    }
                    
                  // ...
                }) { error in
                  print(error.localizedDescription)
                }
                
               
            }
   
                    }
        
    }
    
    @IBAction func btnCreateAccount_TUI(_ sender: Any) {
        
    }
    func showAlert(msg : String)
    {
        let ac = UIAlertController(title: "ERROR", message: msg, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        present(ac, animated: true, completion: nil)
    }
}


