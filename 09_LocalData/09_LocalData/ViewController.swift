//
//  ViewController.swift
//  09_LocalData
//
//  Created by Dogukan Berk Ozer on 20.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfMail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        userDefWrite()
//        userDefRead()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let passwd = UserDefaults.standard.object(forKey: tfMail.text!)
        
        if(segue.identifier == "sgLoginToRegister")
        {
            _ = segue.destination as! VC_Register
        }
        else if(tfPassword.text == (passwd as! String) && tfMail.text != "" && tfPassword.text != ""){
            if(segue.identifier == "sgLoginToHome")
            {
                let vc = segue.destination as! VC_Home
                for member in VC_Register.Members
                {
                    if(member.mail == tfMail.text)
                    {
                        vc.welcome = member.name + " " + member.surname
                        break
                    }
                }
            }
        }
        else
        {
            let ac = UIAlertController(title: "ERROR", message: "User not found ", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true, completion: nil)
        }
        
        
        
        
        
    }
    
//            func userDefWrite()
//            {
//                let userDefaults = UserDefaults.standard
//                userDefaults.set("my value", forKey: "key")
//                userDefaults.synchronize()
//
//            }
//
//            func userDefRead()
//            {
//                if let value = UserDefaults.standard.object(forKey: "key")
//                {
//                    print(value)
//                }
//            }
}

