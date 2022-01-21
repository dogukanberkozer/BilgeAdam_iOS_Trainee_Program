//
//  ViewController.swift
//  07_Cvc
//
//  Created by Dogukan Berk Ozer on 20.01.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var cvList: UICollectionView!
    
    var selectedIndexPath : IndexPath!
    var selectedItemWidth = CGFloat()
    var selectedItemHeight = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cvList.register(UINib(nibName: "CVC_Photo", bundle: nil), forCellWithReuseIdentifier: "CVC_Photo")
        let layout = cvList.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        if (UIDevice.current.orientation.isLandscape)
        {
            let width = (cvList.frame.size.width - 80) / 4
            let height = width * 3/2
            layout.itemSize = CGSize(width: width, height: height)
        }
        else
        {
            let width = (cvList.frame.size.width - 48) / 2
            let height = width * 3/2
            layout.itemSize = CGSize(width: width, height: height)
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC_Photo", for: indexPath) as! CVC_Photo
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if indexPath == selectedIndexPath
        {
            if (UIDevice.current.orientation.isLandscape)
            {
                selectedItemHeight = cvList.frame.size.height
                selectedItemWidth = selectedItemHeight * 2 / 3
            }
            else
            {
                selectedItemWidth = cvList.frame.size.width
                selectedItemHeight = selectedItemWidth * 3 / 2
            }
        }
        return CGSize(width: selectedItemWidth, height: selectedItemHeight)
    }

}

