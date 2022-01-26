//
//  VC_Detail.swift
//  10_Contacts_V2
//
//  Created by Dogukan Berk Ozer on 25.01.2022.
//

import UIKit

class VC_Detail: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvPhones: UITableView!
    var phoneList = [ContactPhone]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phoneList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TVC_Phone", owner: self, options: nil)?.first as! TVC_Phone
        cell.lblPhoneNumber.text = phoneList[indexPath.row].number
        viewDidAppear(true, id: phoneList[indexPath.row].contactId!)
        return cell
    }
    
    func viewDidAppear(_ animated: Bool, id : UUID) {
        phoneList = DataAccessLayer.getAllPhones(contactId: id) ?? []
        tvPhones.reloadData()
    }
    
    var contact : Contact?
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var tfNAme: UITextField!
    @IBOutlet weak var tfSurname: UITextField!
    @IBOutlet weak var tfAddNumber: UITextField!
    @IBOutlet weak var btnAddNumber: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var tvPhoneList: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ivPhoto.image = UIImage(named: "human")
        tfAddNumber.isHidden = true
        btnAddNumber.isHidden = true

        if(contact != nil)
        {
            tfNAme.text = contact?.name
            tfSurname.text = contact?.surname
        }
        else
        {
            btnDelete.isEnabled = false
        }
    }
    
    @IBAction func btnSave(_ sender: Any) {
        if(contact == nil)
        {
            DataAccessLayer.addContact(name: tfNAme.text!, surname: tfSurname.text!)
        }
        else
        {
            contact?.name = tfNAme.text
            contact?.surname = tfSurname.text
            DataAccessLayer.updateContact()
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnDelete(_ sender: Any) {
//        DataAccessLayer.removeContactPhone(contactPhone: <#T##ContactPhone#>)
    }
    
    @IBAction func btnAddNumber(_ sender: Any) {
        if(tfAddNumber.isHidden)
        {
            tfAddNumber.isHidden = false
            btnAddNumber.isHidden = false
        }
        else
        {
            tfAddNumber.isHidden = true
            btnAddNumber.isHidden = true
        }
    }
    @IBAction func btnAddPLUS(_ sender: Any) {
//        DataAccessLayer.addPhoneNumber(contactId: <#UUID#>, number: tfAddNumber.text!)
    }
}
