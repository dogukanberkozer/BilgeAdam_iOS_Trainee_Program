//
//  VC_ToDoList.swift
//  09_LocalData
//
//  Created by Dogukan Berk Ozer on 21.01.2022.
//

import UIKit
import CoreData

class VC_ToDoList: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // CoreData

        func getContext()-> NSManagedObjectContext

        {

            let appDelegate = UIApplication.shared.delegate as! AppDelegate

            return appDelegate.persistentContainer.viewContext

        }

        

        // Kayıt Ekleme

        func veriKaydet(v1 : Int, v2 : String)

        {

            let context = getContext()

            let entity = NSEntityDescription.entity(forEntityName: "Tablo1", in: context)

            

            let veri = NSManagedObject(entity: entity!, insertInto: context)

            

            veri.setValue(v1, forKey: "alan1")

            veri.setValue(v2, forKey: "alan2")

            

            do{

                try context.save()

            }

            catch

            {}

            

        }

        

        func veriGetir()

        {

            let fetchRequest : NSFetchRequest<Tablo1> = Tablo1.fetchRequest()

            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "alan1", ascending: true)]

            

            //fetchRequest.predicate = NSPredicate(format: "alan1 == 10")

            //fetchRequest.predicate = NSPredicate(format: "alan2 == %@", "veri1")

            

            //fetchRequest.predicate = NSPredicate(format: "alan1 == 10 and alan2 contains %@", "a")

            let pred = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [NSPredicate(format: "alan1 == 10"), NSPredicate(format: "alan2 == %@", "veri1")])

            fetchRequest.predicate = pred

            

            do

            {

                let veriler = try getContext().fetch(fetchRequest) as! Tablo1

                print(veriler)

            }catch{}

            

        }

     

        func guncelle()

        {

            try? getContext().save()

        }

        

        func sil(veri : Tablo1)

        {

            getContext().delete(veri)

            

            try? getContext().save()

        }

    
    
    
    
}
