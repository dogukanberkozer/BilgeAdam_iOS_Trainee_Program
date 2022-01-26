//
//  ViewController.swift
//  10_Contacts_V2
//
//  Created by Dogukan Berk Ozer on 25.01.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvList: UITableView!
    var contactList = [Contact]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        contactList = DataAccessLayer.getAllContacts() ?? []
        tvList.reloadData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("TVC_Contact", owner: self, options: nil)?.first as! TVC_Contact
        cell.ivPp.image = UIImage(named: "human")
        cell.lblName.text = contactList[indexPath.row].name
        cell.lblSurname.text = contactList[indexPath.row].surname
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "sgUpdate", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sgUpdate")
        {
            let vc = segue.destination as! VC_Detail
            vc.contact = contactList[sender as! Int]
        }
    }

}

