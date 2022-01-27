//
//  VC_CRUD.swift
//  11_PhotoGalleryApp
//
//  Created by Dogukan Berk Ozer on 27.01.2022.
//

import UIKit

class VC_CRUD: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tvDescription: UITextView!
    @IBOutlet weak var tfLocation: UITextField!
    @IBOutlet weak var btnDelete: UIButton!
    
    var willBeUpdatedObject : Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(willBeUpdatedObject != nil)
        {
            ivPhoto.image = UIImage(data: (willBeUpdatedObject?.image)!)
            tfTitle.text = willBeUpdatedObject?.title
            tfLocation.text = willBeUpdatedObject?.location
            tvDescription.text = willBeUpdatedObject?.desc
        }
        else
        {
            btnDelete.isEnabled = false
        }
    }
    
    @IBAction func btnImageView_TUI(_ sender: Any)
    {
        let ac = UIAlertController(title: "POPUP", message: "Choose one of the options below 🔻", preferredStyle: UIAlertController.Style.alert)
        ac.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction!) in

            if UIImagePickerController.isSourceTypeAvailable(.camera)
            {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }
            else
            {
                self.tfTitle.text = "Cannot access to camera 🚫"
            }
        }))
        ac.addAction(UIAlertAction(title: "Gallery", style: .cancel, handler: { (action: UIAlertAction!) in
          
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
            {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }
            else
            {
                self.tfTitle.text = "Cannot access to photo library 🚫"
            }
        }))
        present(ac, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        let img = info[.originalImage] as! UIImage
        ivPhoto.image = img
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnSave_TUI(_ sender: Any)
    {
        if(willBeUpdatedObject == nil)
        {
            DAL.addPhoto(image: ivPhoto.image!, title: tfTitle.text!, location: tfLocation.text!, description: tvDescription.text!)
        }
        else
        {
            willBeUpdatedObject?.image = ivPhoto.image?.pngData()
            willBeUpdatedObject?.title = tfTitle.text
            willBeUpdatedObject?.location = tfLocation.text
            willBeUpdatedObject?.desc = tvDescription.text
            DAL.updatePhoto()
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnDelete_TUI(_ sender: Any)
    {
        DAL.removePhoto(photo: willBeUpdatedObject!)
        navigationController?.popViewController(animated: true)
    }
}

