//
//  VC_HizmetVerenHome.swift
//  Final_Project
//
//  Created by Sait Cihaner on 4.02.2022.
//

import UIKit
import Firebase

class VC_HizmetVerenHome: UIViewController {
    
    var listOfHizmet : [Hizmet] = []
    var ref:DatabaseReference!
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.dataSource = self
        self.tblView.delegate = self
       ref = Database.database().reference()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
    
        func getData(){
            
            ref.child("User").child(ViewController.currentUserId!).child("hizmetler").observe(.value, with: { snapshot in
            
                self.listOfHizmet.removeAll()

                for category in snapshot.children {
                    print(snapshot.childrenCount)
                    let  c = category as! DataSnapshot
                    let dict = c.value as! [String:Any]

                    let baslik     = dict["baslik"] as! String
                    let aciklama = dict["aciklama"] as! String
                    let kullanici = Hizmet.init()
                    kullanici.baslik = baslik
                    kullanici.aciklama = aciklama
                    
                    self.listOfHizmet.append(kullanici)
                   
                  
                }
                self.tblView.reloadData()

            })
        }
        
    

    @IBAction func cikis(_ sender: Any) {
        do {
                 try Auth.auth().signOut()
            self.navigationController?.popViewController(animated: true)
              } catch{
                  print("error")
              }
    }
    @IBAction func addHizmet(_ sender: Any) {
    }
}

extension VC_HizmetVerenHome : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfHizmet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVC_HizmetVeren", for: indexPath) as! TVC_HizmetVeren
        cell.baslikLlbl.text = listOfHizmet[indexPath.row].baslik
        cell.aciklamaLbl.text = listOfHizmet[indexPath.row].aciklama
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "VC_AddNewHizmet") as! VC_AddNewHizmet
        vc.hizmet = listOfHizmet[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
    

