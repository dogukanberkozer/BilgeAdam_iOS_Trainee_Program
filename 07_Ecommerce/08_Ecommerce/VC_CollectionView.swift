//
//  VC_CollectionView.swift
//  08_Ecommerce
//
//  Created by Dogukan Berk Ozer on 19.01.2022.
//

import UIKit

class VC_CollectionView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
        
    @IBOutlet weak var cvList: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvcYontem1", for: indexPath) as! CVC_Yontem1
        
        cell.imgCvc.image = UIImage(named: "mac")
        cell.lblName.text = "MacBook Pro M1"
        cell.lblPrice.text = "18.999 ₺"
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "29.999 ₺")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        cell.lblOldPrice.attributedText = attributeString
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
