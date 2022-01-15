//
//  VC_Second.swift
//  05_MultiScreen
//
//  Created by Dogukan Berk Ozer on 14.01.2022.
//

import UIKit

class VC_Second: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfSurname: UITextField!
    
    @IBOutlet weak var lblValue: UILabel!
    var incomingValue : String?

    override func viewDidLoad() {
        super.viewDidLoad()

        lblValue.text = incomingValue
    }

    @IBAction func goBack(_ sender: Any) {
        if(navigationController != nil)
        {
            navigationController?.popViewController(animated: true)
        }
        else
        {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func goBack2(_ sender: Any) {
        performSegue(withIdentifier: "sg2To1", sender: nil)
    }
    
//    @IBAction func sendInfo(_ sender: Any) {
//        let VC = self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        present(VC, animated: true, completion: nil)
//        VC.lblName.text = tfName.text
//        VC.lblSurname.text = tfSurname.text
//        VC.lblPhone.text = tfPhone.text
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sgPassBack")
        {
            let VC = segue.destination as! ViewController
            VC.incomingName = tfName.text
            VC.incomingSurname = tfSurname.text
            VC.incomingPhone = tfPhone.text
        }
    }
}
