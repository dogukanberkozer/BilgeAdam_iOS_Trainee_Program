//
//  VC_Register.swift
//  09_LocalData
//
//  Created by Dogukan Berk Ozer on 20.01.2022.
//

import UIKit

class VC_Register: UIViewController {
    
    static var Members = [Member]()

    @IBOutlet weak var lblName: UITextField!
    @IBOutlet weak var lblSurname: UITextField!
    @IBOutlet weak var lblMail: UITextField!
    @IBOutlet weak var lblPassword: UITextField!
    @IBOutlet weak var lblRepassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerMe(_ sender: Any) {
        if(lblPassword.text != lblRepassword.text)
        {
            showAlert(msg: "Passwords do not match ⛔️")
        }
        else
        {
            register(mail: lblMail.text!, password: lblPassword.text!)
            
        }
    }
    
    
    
    func showAlert(msg : String)
    {
        let ac = UIAlertController(title: "ERROR", message: "\(msg)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true, completion: nil)
    }
    
    func register(mail : String, password : String)
    {
        let userDefaults = UserDefaults.standard
        userDefaults.set("\(password)", forKey: "\(mail)")
        userDefaults.synchronize()
        let member = Member()
        member.name = lblName.text
        member.surname = lblSurname.text
        member.mail = lblMail.text
        member.password = lblPassword.text
        VC_Register.Members.append(member)
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        register(mail: lblMail.text!, password: lblPassword.text!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sgRegisterToHome")
        {
            let vc = segue.destination as! VC_Home
            vc.welcome = lblName.text! + " " + lblSurname.text!
        }
    }
}
