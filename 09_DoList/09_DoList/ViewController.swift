//
//  ViewController.swift
//  09_DoList
//
//  Created by Dogukan Berk Ozer on 24.01.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tvList: UITableView!
    var list = [DoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        list = DataAccessLayer.getAllDoItems() ?? []
        tvList.reloadData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TVC_DoItem", owner: self, options: nil)?.first as! TVC_DoItem
        cell.lblTitle.text = list[indexPath.row].title
        cell.lblDesc.text = list[indexPath.row].desc
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "sgUpdate", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sgUpdate")
        {
            let vc = segue.destination as! VC_Detail
            vc.willUpdate = list[sender as! Int]
        }
    }

}

