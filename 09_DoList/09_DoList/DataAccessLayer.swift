//
//  DataAccessLayer.swift
//  09_DoList
//
//  Created by Dogukan Berk Ozer on 24.01.2022.
//

import Foundation
import UIKit
import CoreData

class DataAccessLayer
{
    static func getContext()-> NSManagedObjectContext
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    static func addDoItem(title: String, desc : String, detail : String)
    {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "DoItem", in: context)
        let data = NSManagedObject(entity: entity!, insertInto: context)
        
        data.setValue(title, forKey: "title")
        data.setValue(desc, forKey: "desc")
        data.setValue(detail, forKey: "detail")
        
        do
        {
            try context.save()
        }
        catch
        {
            
        }
    }
    
    static func getAllDoItems() -> [DoItem]?
    {
        let fetchRequest : NSFetchRequest<DoItem> = DoItem.fetchRequest()
        
        do
        {
            return try getContext().fetch(fetchRequest)
        }
        catch
        {
            
        }
        return nil
    }
    
    static func updateDoItem()
    {
        try? getContext().save()
    }
    
    func remove(doItem : DoItem)
    {
        DataAccessLayer.getContext().delete(doItem)
        try? DataAccessLayer.getContext().save()
    }
}
