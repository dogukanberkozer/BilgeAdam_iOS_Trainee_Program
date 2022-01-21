//
//  ViewController.swift
//  08_Ecommerce
//
//  Created by Dogukan Berk Ozer on 18.01.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var categories = [Category]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let computerCategory = Category()
        computerCategory.name = "Computers"
        computerCategory.img = UIImage(named: "comp")
        categories.append(computerCategory)
        let phonesCategory = Category()
        phonesCategory.name = "Phones"
        phonesCategory.img = UIImage(named: "phone")
        categories.append(phonesCategory)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("TVC_Categories", owner: self, options: nil)?.first as! TVC_Categories
        cell.lblCategoryName.text = categories[indexPath.row].name
        cell.imgCategory.image = categories[indexPath.row].img
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "sgProduct", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sgProduct")
        {
            let vc = segue.destination as! VC_Products
            vc.selectedCategory = categories[sender as! Int]
        }
    }
    
}
