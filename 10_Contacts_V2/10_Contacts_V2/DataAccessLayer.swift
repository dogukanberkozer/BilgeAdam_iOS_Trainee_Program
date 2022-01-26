//
//  DataAccessLayer.swift
//  10_Contacts_V2
//
//  Created by Dogukan Berk Ozer on 25.01.2022.
//

import Foundation
import CoreData
import UIKit

class DataAccessLayer
{
    static func getContext()-> NSManagedObjectContext
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
//    Contact
    
    static func addContact(name : String, surname : String)
    {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Contact", in: context)
        let data = NSManagedObject(entity: entity!, insertInto: context)
            
        
        data.setValue(UUID(), forKey: "id")
        data.setValue(name, forKey: "name")
        data.setValue(surname, forKey: "surname")
            
        do
        {
            try context.save()
        }
        catch
        {
                
        }
    }
    
    static func getAllContacts() -> [Contact]?
    {
        let fetchRequest : NSFetchRequest<Contact> = Contact.fetchRequest()
        
        do
        {
            return try getContext().fetch(fetchRequest)
        }
        catch
        {}
        return nil
    }
    
    static func updateContact()
    {
        try? getContext().save()
    }
    
    static func removeContact(contact : Contact)
    {
        DataAccessLayer.getContext().delete(contact)
        try? DataAccessLayer.getContext().save()
    }
    
    
//    Phone
    
    static func addPhoneNumber(contactId : UUID, number : String)
    {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "ContactPhone", in: context)
        let data = NSManagedObject(entity: entity!, insertInto: context)
            
        data.setValue(contactId, forKey: "contactId")
        data.setValue(number, forKey: "number")
            
        do
        {
            try context.save()
        }
        catch
        {
                
        }
    }
    
    static func getAllPhones(contactId : UUID) -> [ContactPhone]?
    {
        let fetchRequest : NSFetchRequest<ContactPhone> = ContactPhone.fetchRequest()
        let pred = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [NSPredicate(format: "contactId == \(contactId)")])
        fetchRequest.predicate = pred
        do
        {
            return try getContext().fetch(fetchRequest)
        }
        catch
        {}
        return nil
    }
    
    static func removeContactPhone(contactPhone : ContactPhone)
    {
        DataAccessLayer.getContext().delete(contactPhone)
        try? DataAccessLayer.getContext().save()
    }
}
