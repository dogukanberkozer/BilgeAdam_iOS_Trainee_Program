//
//  ViewController.swift
//  05_MultiScreen
//
//  Created by Dogukan Berk Ozer on 14.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblSurname: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var tfValue: UITextField!
    
    var incomingName : String?
    var incomingSurname : String?
    var incomingPhone : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblName.text = incomingName
        lblSurname.text = incomingSurname
        lblPhone.text = incomingPhone
    }

    @IBAction func withCode(_ sender: Any) {
//        let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC_Second")
        let VC = self.storyboard!.instantiateViewController(withIdentifier: "VC_Second") as! VC_Second
        VC.incomingValue = "Sended Value"
        present(VC, animated: true, completion: nil)
        
    }
    @IBAction func withCode2(_ sender: Any) {
        performSegue(withIdentifier: "sgPass", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sgPass")
        {
            let VC = segue.destination as! VC_Second
            VC.incomingValue = tfValue.text
        }
    }
    
    @IBAction func sendValue(_ sender: Any) {
        let VC = self.storyboard!.instantiateViewController(withIdentifier: "VC_Second") as! VC_Second
        present(VC, animated: true, completion: nil)
        VC.lblValue.text = tfValue.text
    }
    
    @IBAction func GoBack_2_to_1(segue : UIStoryboardSegue)
    {
        print("go back")
    }
    
}
