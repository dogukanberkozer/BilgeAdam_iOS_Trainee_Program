//
//  ViewController.swift
//  11_PhotoGalleryApp
//
//  Created by Dogukan Berk Ozer on 26.01.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var cvPhotoList: UICollectionView!
    var photoList = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cvPhotoList.register(UINib(nibName: "CVC_Photo", bundle: nil), forCellWithReuseIdentifier: "CVC_Photo")
        let layout = cvPhotoList.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let width = (cvPhotoList.frame.size.width - 32) / 3
        let height = width
        layout.itemSize = CGSize(width: width, height: height)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        photoList = DAL.getAllPhotos() ?? []
        cvPhotoList.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC_Photo", for: indexPath) as! CVC_Photo
        cell.ivPhoto.image = UIImage(data: photoList[indexPath.row].image!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "sgUpdate", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sgUpdate")
        {
            let vc = segue.destination as! VC_CRUD
            vc.willBeUpdatedObject = photoList[sender as! Int]
        }
    }
}
 
