//
//  VC_Products.swift
//  08_Ecommerce
//
//  Created by Dogukan Berk Ozer on 19.01.2022.
//

import UIKit

class VC_Products: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var lblCategoryName: UILabel!
    
    var selectedCategory = Category()
    var computers = [Product]()
    var phones = [Product]()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        let computer1 = Product()
        computer1.category = selectedCategory
        computer1.imgProduct = UIImage(named: "mac")
        computer1.title = "Macbook"
        computer1.subTitle = "Pro M1 Apple Silicon, 8 çekirdekli CPU, 8 çekirdekli GPU, 16 çekirdekli Neural Engine"
        computer1.description = "Apple M1 çip, 13 inç MacBook Pro’ya inanılmaz bir hız ve güç kazandırıyor. 2,8 kata kadar daha yüksek CPU performansı. 5 kata kadar daha hızlı grafik teknolojileri. En gelişmiş Neural Engine birimimiz sayesinde 11 kata kadar daha hızlı yapay öğrenme. Ve gün boyunca devam etmenizi sağlayan 20 saate kadar pil ömrü. En sevilen profesyonel dizüstü bilgisayarımız şimdi bambaşka bir seviyede."
        computer1.price = 18999.99
        computer1.oldPrice = 29999.99
        computers.append(computer1)
        
        let computer2 = Product()
        computer2.category = selectedCategory
        computer2.imgProduct = UIImage(named: "mac")
        computer2.title = "Macbook"
        computer2.subTitle = "Pro M1 Apple Silicon, 8 çekirdekli CPU, 8 çekirdekli GPU, 16 çekirdekli Neural Engine"
        computer2.description = "Apple M1 çip, 13 inç MacBook Pro’ya inanılmaz bir hız ve güç kazandırıyor. 2,8 kata kadar daha yüksek CPU performansı. 5 kata kadar daha hızlı grafik teknolojileri. En gelişmiş Neural Engine birimimiz sayesinde 11 kata kadar daha hızlı yapay öğrenme. Ve gün boyunca devam etmenizi sağlayan 20 saate kadar pil ömrü. En sevilen profesyonel dizüstü bilgisayarımız şimdi bambaşka bir seviyede."
        computer2.price = 18999.99
        computers.append(computer2)
        
        lblCategoryName.text = selectedCategory.name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(selectedCategory.name == "Computers")
        {
            return computers.count
        }
        else if(selectedCategory.name == "Phones")
        {
            return phones.count
        }
        else
        {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("TVC_Products", owner: self, options: nil)?.first as! TVC_Products
        cell.imgProduct.image = computers[indexPath.row].imgProduct
        cell.lblTitle.text = computers[indexPath.row].title
        cell.lblSubTitle.text = computers[indexPath.row].subTitle
        cell.lblPrice.text = String(computers[indexPath.row].price)
        if(computers[indexPath.row].oldPrice != nil)
        {
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: String(computers[indexPath.row].oldPrice!))
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
            cell.lblOldPrice!.attributedText = attributeString
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "sgProductDetail", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sgProductDetail")
        {
            let vc = segue.destination as! VC_ProductDetail
            
            
            
            
        }
    }

}
