//
//  DAL.swift
//  11_PhotoGalleryApp
//
//  Created by Dogukan Berk Ozer on 26.01.2022.
//

import Foundation
import UIKit
import CoreData

class DAL
{
    static func getContext()-> NSManagedObjectContext
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    static func addPhoto(image : UIImage, title : String, location : String, description : String)
    {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Photo", in: context)
        let data = NSManagedObject(entity: entity!, insertInto: context)
                
        data.setValue(image.pngData(), forKey: "image")
        data.setValue(title, forKey: "title")
        data.setValue(location, forKey: "location")
        data.setValue(description, forKey: "desc")
                
        do
        {
            try context.save()
        }
        catch
        {}
    }
    
    static func getAllPhotos() -> [Photo]?
    {
        let fetchRequest : NSFetchRequest<Photo> = Photo.fetchRequest()
            
        do
        {
            return try getContext().fetch(fetchRequest)
        }
        catch
        {}
        return nil
    }
        
    static func updatePhoto()
    {
        try? getContext().save()
    }
        
    static func removePhoto(photo : Photo)
    {
        DAL.getContext().delete(photo)
        try? DAL.getContext().save()
    }
}
