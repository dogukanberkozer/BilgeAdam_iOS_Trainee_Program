//
//  VC_Register.swift
//  Final_Project
//
//  Created by Dogukan Berk Ozer on 3.02.2022.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseAuth

class VC_Register: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet var txt_Ad: UITextField!
    @IBOutlet var txt_Soyad: UITextField!
    @IBOutlet var txt_Telefon: UITextField!
    @IBOutlet var txt_Email: UITextField!
    @IBOutlet var txt_Sifre: UITextField!
    @IBOutlet var txt_Sifre2: UITextField!
    @IBOutlet var txt_Tanitim: UITextView!
    @IBOutlet weak var pvPicker: UIPickerView!
    //    @IBOutlet var btn_HizmetVeren_OUT: UIButton!
    //    @IBOutlet var btn_HizmetAlanOUT: UIButton!
    
    let source = ["Hizmet Alan", "Hizmet Veren"]
    
    var isHizmetVeren = false
    
    var ref : DatabaseReference!
    var tanitimDeger = ""
    var userID : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

        txt_Email.text = "wedsa123@gmail.com"

        pvPicker.delegate = self
        pvPicker.dataSource = self
        
        
        
        txt_Tanitim.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return source.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return source[row]
    }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(source[row] == "Hizmet Veren")
        {
            txt_Tanitim.isHidden = false
            isHizmetVeren = true
        }
        else
        {
            txt_Tanitim.isHidden = true
        }
        
        
    }
    
    @IBAction func btnCreate_TUI(_ sender: Any) {
        
        guard txt_Ad.text != "", "" != txt_Soyad.text, "" !=  txt_Telefon.text, "" !=  txt_Email.text, "" !=  txt_Sifre.text, "" !=  txt_Sifre2.text else
        {
            showAlert(msg: "Tum alanlar doldurulmali!!")
            return
        }
        
        if(isValidEmailAddress(emailAddressString: txt_Email.text!) == false)
        {
            showAlert(msg: "Email dogru formatta olmali")
        }
        
        if(txt_Sifre2.text != txt_Sifre.text)
        {
            showAlert(msg: "Sifreler ayni olmali")
        }
        
        if(isHizmetVeren)
        {
            guard txt_Tanitim.text != "" else {
                showAlert(msg: "Tanitim alani doldurulmali!!")
                return
            }
        }
        
        var model :MainKullanici

                if(isHizmetVeren)
                {
                    model = HizmetVeren.init()

                    guard let model = model as? HizmetVeren else {
                        return
                    }
                    model.name = txt_Ad.text
                    model.soyad = txt_Soyad.text
                    model.telNumber = txt_Telefon.text
                    model.email = txt_Email.text
                    model.password = txt_Sifre2.text
                    model.tanitim = txt_Tanitim.text
                    tanitimDeger = model.tanitim
                }
        else
        {
            model = HizmetAlan.init()

            guard let model = model as? HizmetAlan else {
                return
            }
            model.name = txt_Ad.text
            model.soyad = txt_Soyad.text
            model.telNumber = txt_Telefon.text
            model.email = txt_Email.text
            model.password = txt_Sifre2.text
        }
        
        
        
        
        Auth.auth().createUser(withEmail: txt_Email.text!, password: txt_Sifre.text!) { authResult, error in
          
            if error != nil {
                self.showAlert(msg: "hata-giriş yapılamadı")
            } else {
                
                let u : [String : Any] = [
                    "name" : model.name,
                    "surname" : model.soyad,
                    "telefon" : model.telNumber,
                    "tip" : model.kullaniciTipi?.rawValue,
                    "tanitim" : self.tanitimDeger
                        ]

                self.ref.child("User").child(authResult?.user.uid as! String).setValue(u)
                
                self.userID = authResult?.user.uid
//                self.ref.child("User").child(u["surname"] as! String).setValue(u)
//                self.ref.child("User").child(u["telefon"] as! String).setValue(u)
//                self.ref.child("User").child(u["tip"] as! String).setValue(u)
//                self.ref.child("User").child(u["tanitim"] as! String).setValue(u)
                
                self.ref.child("User").child(self.userID!).getData { error, snapshot in
                    
                    print("getData")
                    print(snapshot)
                }

                print("başarılı")


                    }

                
            }
            dismiss(animated: true, completion: nil)
        
        
        
        
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {

     var returnValue = true
     let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"

     do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))

            if results.count == 0
            {
                returnValue = false
            }

     } catch _ as NSError {
            print("invalid regex: (error.localizedDescription)")
            returnValue = false
        }

        return  returnValue
    }
    
    func showAlert(msg : String)
    {
        let ac = UIAlertController(title: "ERROR", message: msg, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        present(ac, animated: true, completion: nil)
    }
    
    
}
