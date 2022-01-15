//
//  ViewController.swift
//  04_Entry
//
//  Created by Dogukan Berk Ozer on 13.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfMail: UITextField!
    @IBOutlet weak var lblGiris: UILabel!
    @IBOutlet weak var btnSignin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }

    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            label.text = "First segment"
        case 1:
            label.text = "Second segment"
        case 2:
            label.text = "Third segment"
        default:
            break
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    @IBAction func pressBtnSignin(_ sender: Any) {
        
        if(tfMail.text != "" && tfMail.text != nil)
        {
            if(isValidEmail(tfMail.text!))
            {
                if(tfPassword.text!.count >= 6)
                {
                    let decimalCharacters = CharacterSet.decimalDigits
                    let decimalRange = tfPassword.text!.rangeOfCharacter(from: decimalCharacters)
                    if decimalRange != nil {
                        lblGiris.text = "SUCCESFULL LOGIN"
                    }
                    else
                    {
                        hataGoster(msg: "password must has at least 1 digit")
                    }
                }
                else
                {
                    hataGoster(msg: "password must has at least 6 chars")
                }
            }
            else
            {
                hataGoster(msg: "invalid e-mail format")
            }
        }
        else
        {
            hataGoster(msg: "e-mail can not be nil")
        }
    }
    
    func hataGoster(msg : String)
    {
        let nullMail = UIAlertController(title: "ERROR", message: msg, preferredStyle: .alert)
        nullMail.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(nullMail, animated: true, completion: nil)
    }
    
}

